class DropTickets < ActiveRecord::Migration[7.2]
  def change
    drop_table :tickets
  end
end
