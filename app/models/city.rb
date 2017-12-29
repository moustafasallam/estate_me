class City < ActiveRecord::Base
  belongs_to :state
  has_many :real_estates

  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false, scope: :state_id }
  validates :state, presence: true
end