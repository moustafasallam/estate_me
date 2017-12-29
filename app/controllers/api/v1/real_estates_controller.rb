module Api::V1
	class RealEstatesController < Api::BaseController
		skip_before_action :verify_authenticity_token

		def index
			@real_estates = paginate RealEstate.all
			success()
		end

		def show
			@real_estate = RealEstate.where(id: params[:id]).first
			@real_estate.present? ? success() : error(404, "record no found!")
		end

		def create
			data = params[:real_estate] || params
		end

	end
end