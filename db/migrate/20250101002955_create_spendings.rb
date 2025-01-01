class CreateSpendings < ActiveRecord::Migration[8.0]
  def change
    create_table :spendings do |t|
      t.string :name
      t.decimal :price
      t.decimal :kilograms
      t.decimal :quantity
      t.string :date_time_utc

      t.timestamps
    end
  end
end
