class Admin::RealEstatesController < ApplicationController

	def index
		@real_estates = RealEstate.search(params[:query]) || [] rescue []
	end

end