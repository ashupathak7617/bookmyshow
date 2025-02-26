class AddStatusToSeat < ActiveRecord::Migration[7.2]
  def change
    add_column :seats, :status, :boolean, default: "true"
  end
end
