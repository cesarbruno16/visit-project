class CreateFacilityHotels < ActiveRecord::Migration[5.2]
	def change
		create_table :facility_hotels do |t|
			t.belongs_to :hotel, foreign_key: true
			t.belongs_to :facility, foreign_key: true

			t.timestamps
		end
	end
end
