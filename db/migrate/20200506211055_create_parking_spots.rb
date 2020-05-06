class CreateParkingSpots < ActiveRecord::Migration[6.0]
  def change
    create_table :parking_spots do |t|
      t.string :number, null: false
      t.string :aws_id, null: false
      t.references :location

      t.timestamps
    end

    add_index :parking_spots, [:number, :location_id]
  end
end
