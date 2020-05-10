class AddDescToParkingSpots < ActiveRecord::Migration[6.0]
  def change
    change_table :parking_spots do |t|
      t.string :desc
    end
  end
end
