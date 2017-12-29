module Api
	class BaseController < ApplicationController

	  rescue_from ActionController::RoutingError, :with => :render_404


	  def error(status = 500, message="Server Error")
	    render json: {success: false, code: status, message: message, payload: {}}, status: status
	  end

	  def success(data=nil, message="SUCCESS")
	    data = JSON.parse render_to_string if data.nil?
	    render json: {success: true, code: 200 , message: message, payload: data}, status: '200'
	  end

	  def render_404
	    error(404, 404, "Unknown API method")
	  end

	end
end