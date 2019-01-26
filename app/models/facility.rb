class Facility < ApplicationRecord
  	belongs_to :user
  	has_many :facility_hotels
  	has_many :hotels, through: :facility_hotels

  	default_scope -> {order(:name)}

  	validates :name, presence: true
  	validates :name, uniqueness: true

  	def self.select_list
  		all.map{|f| [f.name, f.id]}.uniq{|f| f.first}
  	end
end
