class AddTheaterRefToScreen < ActiveRecord::Migration[7.2]
  def change
    add_reference :screens, :theater, null: false, foreign_key: true
  end
end
