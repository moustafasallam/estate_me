class Country < ActiveRecord::Base
  has_many :states, dependent: :nullify

  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false }
end