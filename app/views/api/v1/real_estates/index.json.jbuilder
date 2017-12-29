json.array!(@real_estates) do |e|
	json.id e.id
	json.name e.name
	json.description e.description
	json.state e.state
	json.start_date e.start_date
	json.end_date e.end_date
	json.location e.location
	json.latitude e.latitude
	json.longitude e.longitude
end