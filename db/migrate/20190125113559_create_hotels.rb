class CreateHotels < ActiveRecord::Migration[5.2]
    def change
        create_table :hotels do |t|
            t.string :name
            t.float :price
            t.string :country
            t.string :state
            t.string :city
            t.string :address
            t.belongs_to :user, foreign_key: true

            t.timestamps
        end
    end
end
