class AddColumnToSeats < ActiveRecord::Migration[7.2]
  def change
    add_column :seats, :seat_create, :integer
  end
end
