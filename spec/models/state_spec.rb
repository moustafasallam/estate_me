require 'rails_helper'

RSpec.describe State, type: :model do

  let(:state)  {State.first}

  describe "State" do

    it "must have country" do
      state.country_id = nil
      expect{state.save!}.to raise_error(ActiveRecord::RecordInvalid)
    end

    it "must have name" do
      state.name = nil
      expect{state.save!}.to raise_error(ActiveRecord::RecordInvalid)
    end

  end

end