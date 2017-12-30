require 'rails_helper'

RSpec.describe Country, type: :model do

  let(:country)  {Country.first}

  describe "Country" do

    it "must have name" do
      country.name = nil
      expect{country.save!}.to raise_error(ActiveRecord::RecordInvalid)
    end

    it "must have alpha2" do
      country.alpha2 = nil
      expect{country.save!}.to raise_error(ActiveRecord::RecordInvalid)
    end

  end

end