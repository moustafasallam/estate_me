require 'rails_helper'

RSpec.describe GroupEvent, type: :model do

  let(:group_event)        {build(:published_event)}
  let(:end_event)        {build(:end_event)}
  let(:past_event)        {build(:past_event)}

  describe "GroupEvent" do

    it "expect state to be published" do
      expect(group_event.state).to eq("published")
    end

    it "end date is less than start date" do
    	validator = GroupEventValidator.new(end_event.as_json(root: false))
    	expect(validator.is_valid?).to eq(false)
    	expect(validator.message).to eq("date range wrong, end date can't be less than start date")
  	end

  	it "start date in the past" do
  		validator = GroupEventValidator.new(past_event.as_json(root: false))
  		expect(validator.is_valid?).to eq(false)
    	expect(validator.message).to eq("can't set start date in the past")
  	end

  	it "valid Event" do
  		validator = GroupEventValidator.new(group_event.as_json(root: false))
  		expect(validator.is_valid?).to eq(true)
  	end

  end

end