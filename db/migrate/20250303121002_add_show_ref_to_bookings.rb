class AddShowRefToBookings < ActiveRecord::Migration[7.2]
  def change
    # add_reference :bookings, :show, null: false, foreign_key: true
  end
end
