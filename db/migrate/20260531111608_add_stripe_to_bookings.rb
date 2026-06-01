class AddStripeToBookings < ActiveRecord::Migration[7.2]
  def change
    add_column :bookings, :stripe_session_id, :string
    add_column :bookings, :status, :string
  end
end
