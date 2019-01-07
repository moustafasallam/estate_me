require 'rails_helper'

RSpec.describe Api::V1::RealEstatesController , type: :controller do

  describe "GET #index" do
    subject {get :index, format: :json}
    it "renders successfully" do
      expect(response.code.to_i).to eq(200)
    end
  end

  describe "GET #show" do
    subject {get :show, id: real_estate.id, format: :json}
    let(:real_estate)  {RealEstate.first}
    it "successful" do
      expect(response.code.to_i).to eq(200)
    end

  end

  describe "GET #search" do
    subject {get :search, format: :json}
    it "renders successfully" do
      expect(response.code.to_i).to eq(200)
    end
  end

end