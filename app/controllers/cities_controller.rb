class CitiesController < ApplicationController
	def index
		@cities = CS.get(params[:country], params[:state])
		respond_to :js
	end
end