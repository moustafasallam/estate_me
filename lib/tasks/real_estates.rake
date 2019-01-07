namespace :real_estates do

  desc "import real estates from csv file"
  task :import, [:country_code, :filename] => :environment do |t, args|
  	filename = args.filname.present? ? args.filename : 'Sacramentorealestatetransactions.csv'
  	country_code = args.country_code.present? ? args.country_code : 'US'
  	csv_path = "#{Rails.root.join('public','csv')}/#{filename}"
  	importer = RealEstatesImporter.new(country_code)
    reader = CSV.read(csv_path)
    reader.shift
    reader.each_with_index do |x, i|
    	importer.add_new_real_estate(x)
    	printf("\r[%-25s] #{i+1}/#{reader.count} ", "=" * ((i+1.0)/reader.count*25) )
    end
  end

end
