class StatesController < ApplicationController

	def index
	   	@states = CS.states(params[:country])
	   	respond_to :js
	end
end