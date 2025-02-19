class CreateTickets < ActiveRecord::Migration[7.2]
  def change
    create_table :tickets do |t|
      t.decimal :price
      t.string :status
      
      t.references :movie, null: false, foreign_key: true
      t.references :show, null: false, foreign_key: true
      t.references :customer, null: false, foreign_key: true
      t.references :screen, null: false, foreign_key: true
      t.references :theater, null: false, foreign_key: true
      t.references :seat, null: false, foreign_key: true

      t.timestamps
    end
  end
end
