namespace :real_estates do

  desc "add new real estate"
  task :create => :environment do
    conductor = AmqpConductor.new
    data = conductor.receive
    data.each do |params|
      e = RealEstate.new
      e.save!
    end
    conductor.close
  end

  desc "import real estates from csv file"
  task :import => :environment do

  end

end
