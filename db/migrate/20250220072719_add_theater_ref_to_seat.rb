class AddTheaterRefToSeat < ActiveRecord::Migration[7.2]
  def change
    add_reference :seats, :theater, null: false, foreign_key: true
  end
end
