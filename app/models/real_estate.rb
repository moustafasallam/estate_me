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
      indexes :sq_ft, type: :float
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


  def self.search(query="", options={})
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
    # unless options.blank?
    #   search_definition[:from] = 0
    #   search_definition[:size] = ELASTICSEARCH_MAX_RESULTS
    # end

    if query.present?
      search_definition[:query][:dis_max][:queries] << {term: {estate_type: query}}
    end
    if options[:price_from].present?
      price_range = FloatRangeGenerator.new(options[:price_from], options[:price_to])
      price_range.generate
      search_definition[:query][:dis_max][:queries] << {range: {price: {gte: price_range.from, lte: price_range.to}}}
    end
    if options[:space_from].present?
      space_range = FloatRangeGenerator.new(options[:space_from], options[:space_to], FloatRangeGenerator::SPACE)
      space_range.generate
      search_definition[:query][:dis_max][:queries] << {range: {sq_ft: {gte: space_range.from, lte: space_range.to}}}
    end
    __elasticsearch__.search(search_definition).page(options[:page]).records rescue []
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