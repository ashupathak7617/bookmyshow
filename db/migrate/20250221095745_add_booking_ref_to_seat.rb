class AddBookingRefToSeat < ActiveRecord::Migration[7.2]
  def change
    # add_reference :seats, :booking, foreign_key: true
  end
end
