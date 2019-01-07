class State < ActiveRecord::Base
  belongs_to :country
  has_many :cities, dependent: :nullify

  validates :country, presence: true
  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false, scope: :country_id }
end