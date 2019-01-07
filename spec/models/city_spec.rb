require 'rails_helper'

RSpec.describe City, type: :model do

  let(:city)  {City.first}

  describe "City" do

    it "must have state" do
      city.state_id = nil
      expect{city.save!}.to raise_error(ActiveRecord::RecordInvalid)
    end

    it "must have name" do
      city.name = nil
      expect{city.save!}.to raise_error(ActiveRecord::RecordInvalid)
    end

  end

end