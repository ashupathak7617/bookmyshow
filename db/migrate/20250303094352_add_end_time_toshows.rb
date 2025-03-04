class AddEndTimeToshows < ActiveRecord::Migration[7.2]
  def change
    add_column :shows, :end_time, :datetime
  end
end
