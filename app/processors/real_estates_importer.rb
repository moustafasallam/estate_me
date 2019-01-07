class RealEstatesImporter

	HEADERS = ['street', 'city', 'zip', 'state', 'beds', 'baths', 'sq_ft', 'estate_type', 'sale_date', 'price', 'latitude', 'longitude']

	def initialize(country_code)
		get_country(country_code)
	end

	def add_new_real_estate(data)
		if @country.present?
			@hash = HEADERS.zip(data).to_h
			get_state(@hash['state'])
			if @state.present?
				get_city(@hash['city'])
				if @city.present?
					@real_estate = RealEstate.new(@hash.except('city', 'state'))
					@real_estate.city_id = @city.id
					@real_estate.name = @real_estate.street
					@real_estate.save
				end
			end
		end
	end

	def estate
		@real_estate
	end

private

	def get_country(country_code)
		@country = Country.where(alpha2: country_code).first
		if @country.blank?
			c = ISO3166::Country.find_country_by_alpha2(country_code)
			if c.present?
				@country = Country.create(name: c.data['name'], alpha2: c.data['alpha2'])
			end
		end
	end

	def get_state(state_code)
		unless @state.present? && @state.alpha2 == state_code
			@state = State.where(alpha2: state_code, country_id: @country.id).first
			if @state.blank?
				s = ISO3166::Country.find_country_by_alpha2(@country.alpha2).states[state_code]
				if s.present?
					@state = State.create(name: s["name"], country_id: @country.id, alpha2: state_code)
				end
			end
		end
	end

	def get_city(city_name)
		unless @city.present? && @city.name == city_name
			@city = City.where(name: city_name, state_id: @state.id).first
			if @city.blank?
				@city = City.create(name: city_name, state_id: @state.id)
			end
		end
	end

end

  #street       city        zip   state beds  baths sq__ft  type        sale_date                     price latitude  longitude
  #3526 HIGH ST SACRAMENTO  95838 CA    2     1     836     Residential Wed May 21 00:00:00 EDT 2008  59222 38.631913 -121.434879