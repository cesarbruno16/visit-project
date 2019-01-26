class Hotel < ApplicationRecord
  	belongs_to :user
  	has_many :facility_hotels
  	has_many :facilities, through: :facility_hotels

  	validates :name, :price, :country, :state, :city, :address, presence: true

  	def self.filters select_facilities, select_country, select_state, select_city, min_price, max_price, text
  		if select_facilities.blank? and select_country.blank? and select_state.blank? and select_city.blank? and min_price.blank? and max_price.blank?
  			all.includes(facility_hotels: :facility)
  		else
  			hotels = []
  			any_filter = false
  			if !select_city.blank?
  				hotels = where(city: select_city, country: select_country, state: select_state).includes(facility_hotels: :facility)
  				any_filter = true
  			elsif !select_state.blank? and !any_filter
  				hotels = where(country: select_country, state: select_state).includes(facility_hotels: :facility)
  				any_filter = true
  			elsif !select_country.blank? and !any_filter
  				hotels = where(country: select_country).includes(facility_hotels: :facility)
  				any_filter = true
  			end
  			
  			if !select_facilities.blank?
  				if hotels.empty? and !any_filter
  					hotels = joins(facility_hotels: :facility).where(facility_hotels: {facility: select_facilities}).includes(facility_hotels: :facility)
  				else
  					hotels = hotels.joins(facility_hotels: :facility).where(facility_hotels: {facility: select_facilities}).includes(facility_hotels: :facility)
  				end
  				any_filter = true
  			end

  			if !min_price.blank? or !max_price.blank?
  				q = ""
  				q += "price >= #{min_price}" if !min_price.blank?
  				q += " AND price <= #{max_price}" if !max_price.blank?
  				if hotels.empty? and !any_filter
  					hotels = where(q).includes(facility_hotels: :facility) if !q.blank?
  				else
  					hotels = hotels.where(q).includes(facility_hotels: :facility) if !q.blank?
  				end
  				any_filter = true if !hotels.empty?
  			end

  			if !text.blank?
  				if hotels.empty? and !any_filter
  					hotels = where("hotels.name ILIKE ?", "%#{text}%").includes(facility_hotels: :facility)
  				else
  					hotels = hotels.where("hotels.name ILIKE ?", "%#{text}%").includes(facility_hotels: :facility)
  				end
  				any_filter = true
  			end

	  		hotels.uniq
	  	end
  	end
end
