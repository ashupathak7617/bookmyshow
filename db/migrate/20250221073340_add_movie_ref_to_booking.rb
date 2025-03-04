class AddMovieRefToBooking < ActiveRecord::Migration[7.2]
  def change
    # add_reference :bookings, :screen, null: false, foreign_key: true
  end
end
