class FacilityHotel < ApplicationRecord
  	belongs_to :hotel
  	belongs_to :facility
end
