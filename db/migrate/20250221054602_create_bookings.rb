class CreateBookings < ActiveRecord::Migration[7.2]
  def change
    create_table :bookings do |t|
      t.references :seat, null: false, foreign_key: true
      t.references :movie, null: false, foreign_key: true
      t.references :theater, null: false, foreign_key: true
      t.references :customer, null:false, foreign_key: true

      t.timestamps
    end
  end
end
