class Admin::RealEstatesController < ApplicationController

	def index
		@real_estates = params[:query].present? ? RealEstate.search(params[:query]).records : []
	end

end