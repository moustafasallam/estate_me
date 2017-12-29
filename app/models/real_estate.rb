require 'elasticsearch/model'

class RealEstate < ActiveRecord::Base
	include ActiveModel::Transitions
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  belongs_to :city

  validates :city, presence: true
  validates :street, presence: true
  validates :estate_type, presence: true

  geocoded_by :location
  after_validation :geocode


  def as_indexed_json(options={})
    as_json(only: [:estate_type, :price, :sq_feet])
  end

  def location
    if self.latitude.blank? || self.longitude.blank?

    end
  end

end

  #street       city        zip   state beds  baths sq__ft  type        sale_date                     price latitude  longitude
  #3526 HIGH ST SACRAMENTO  95838 CA    2     1     836     Residential Wed May 21 00:00:00 EDT 2008  59222 38.631913 -121.434879