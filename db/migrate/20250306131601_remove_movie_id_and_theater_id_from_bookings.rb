class RemoveMovieIdAndTheaterIdFromBookings < ActiveRecord::Migration[7.2]
  def change
    remove_column :bookings, :movie_id 
    remove_column :bookings, :theater_id
  end
end
