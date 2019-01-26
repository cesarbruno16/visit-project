class HotelsController < ApplicationController
	before_action :authenticate_user!, only: [:new, :create]
	before_action :has_permission, only: [:new, :create]
	before_action :filters, only: [:index, :new, :create]

	# GET
	def index
		@hotels = Hotel.filters(params[:select_facilities], params[:select_coutry], params[:select_state], params[:select_city], params[:min_price], params[:max_price], params[:text])
	end

	# GET
	def new
		@hotel = Hotel.new
	end

	# POST
	def create
		@hotel = Hotel.new(hotel_params.merge(user: current_user, country: params[:select_coutry], state: params[:select_state], city: params[:select_city]))
		respond_to do |format|
      		if @hotel.save
      			params[:hotel][:facilities].reject!{ |c| c.blank? }.each{|f| FacilityHotel.create(facility_id: f.to_i, hotel: @hotel)}
        		format.html { redirect_to hotels_path, notice: 'Success' }
      		else
        		format.html { render :new }
      		end
    	end
	end

	private
		def has_permission
			unless current_user.admin?
				respond_to do |format|
				    format.html do
				      render file: "#{Rails.root}/public/403.html",
				      layout: false, status: 403
				    end
				end and return
			end
		end

		def filters
			@countries = CS.countries.map { |c| [c[1], c[0]] }
			@facilities = Facility.select_list
		end

		def hotel_params
			params.require(:hotel).permit(:name, :price, :address)
		end
end