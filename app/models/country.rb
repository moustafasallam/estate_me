class Country < ActiveRecord::Base
  has_many :states, dependent: :nullify

  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false }
 	validates :alpha2, presence: true
  validates :alpha2, uniqueness: { case_sensitive: false }


  def self.get(country_code)
		country = where(alpha2: country_code).first
		if country.blank?
			c = ISO3166::Country.find_country_by_alpha2(country_code)
			if c.present?
				country = create(name: c.data['name'], alpha2: c.data['alpha2'])
			end
		end
		country
	end

end