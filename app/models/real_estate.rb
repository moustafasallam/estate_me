require 'elasticsearch/model'

class RealEstate < ActiveRecord::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  belongs_to :city

  validates :city, presence: true
  validates :street, presence: true
  validates :estate_type, presence: true

  geocoded_by :geo_location
  after_validation :geocode



################elastic search methods#######################

  settings index: { number_of_shards: 1 } do
    mapping dynamic: false do
      indexes :estate_type, analyzer: 'english'
      indexes :price, type: :float
      indexes :sq_feet, type: :float
    end
  end


  # def self.search(query=nil, options={})
  #   options ||= {}
  #   return [] if query.blank? && options.blank?

  #   search_definition = {
  #     query: {
  #       bool: {
  #         must: [],
  #         filter: []
  #       }
  #     }
  #   }

  #   unless options.blank?
  #     search_definition[:from] = 0
  #     search_definition[:size] = ELASTICSEARCH_MAX_RESULTS
  #   end

  #   # query
  #   if query.present?
  #     search_definition[:query][:bool][:must] << {
  #       multi_match: {
  #         query: query,
  #         fields: %w(estate_type),
  #         operator: 'or'
  #       }
  #     }
  #   end

  #   search_definition[:query][:bool][:filter] << {
  #     range: { price: {
  #               gte: 89921.0,
  #               lte: 89921.0
  #             }
  #     }
  #   }
  #   __elasticsearch__.search(search_definition)
  # end


  def self.search(query=nil, price_range=nil, space_range=nil, options={})
    options ||= {}

    search_definition = {
      query: {
        dis_max: {
            tie_breaker: 0.7,
            boost: 1.2,
            queries: []
         }
      }
    }

    unless options.blank?
      search_definition[:from] = 0
      search_definition[:size] = ELASTICSEARCH_MAX_RESULTS
    end


    search_definition[:query][:dis_max][:queries] << {term: {estate_type: query}}
    search_definition[:query][:dis_max][:queries] << {range: {price: {lte: 265000.0, gte: 265000.0}}}


    __elasticsearch__.search(search_definition)
  end

############################################################
  def geo_location
    if self.latitude.blank? || self.longitude.blank?
      self.location
    end
  end

  def location
    city_name = self.city.name rescue ''
    state_name = self.city.state.name rescue ''
    country_name = self.city.state.country.name rescue ''
    "#{self.street}, #{self.zip}, #{city_name}, #{state_name}, #{country_name}"
  end


end