class CreateScreens < ActiveRecord::Migration[7.2]
  def change
    create_table :screens do |t|
      t.string :screen_name

      t.timestamps
    end
  end
end
