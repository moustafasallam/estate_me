module Api::V1
	class RealEstatesController < Api::BaseController

		def index
			@real_estates = paginate RealEstate.all
			success()
		end

		def show
			@real_estate = RealEstate.where(id: params[:id]).first
			@real_estate.present? ? success() : error(404, "record no found!")
		end

		def search
			options = {price_from: params[:price_from], price_to: params[:price_to], space_from: params[:space_from], space_to: params[:space_to], page: params[:page]}
			@real_estates = RealEstate.search(params[:query], options)
			success()
		end

	end
end