class AddPriceToSeats < ActiveRecord::Migration[7.2]
  def change
    add_column :seats, :price, :integer
  end
end
