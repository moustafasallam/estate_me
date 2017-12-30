require 'rails_helper'

RSpec.describe RealEstate, type: :model do

  let(:real_estate)  {RealEstate.first}

  describe "RealEstate" do

    it "expect real estate to have a location" do
      expect(real_estate.location).to be_a(String)
    end

    it "search with result" do
      expect(RealEstate.search).to be_instance_of(Elasticsearch::Model::Response::Records)
      expect(RealEstate.search('condo')).to be_instance_of(Elasticsearch::Model::Response::Records)
    end

    it "must have type" do
      real_estate.estate_type = nil
      expect{real_estate.save!}.to raise_error(ActiveRecord::RecordInvalid)
    end

    it "must have city" do
      real_estate.city_id = nil
      expect{real_estate.save!}.to raise_error(ActiveRecord::RecordInvalid)
    end

    it "must have street" do
      real_estate.street = nil
      expect{real_estate.save!}.to raise_error(ActiveRecord::RecordInvalid)
    end

  end

end