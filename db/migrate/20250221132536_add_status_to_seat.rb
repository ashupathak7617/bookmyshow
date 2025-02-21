class AddStatusToSeat < ActiveRecord::Migration[7.2]
  def change
    add_column :seats, :status, :string, default: "true"
  end
end
