class CreateDiningTables < ActiveRecord::Migration[5.1]
  def change
    create_table :dining_tables do |t|
      t.integer :number, null: false, limit: 2
      t.integer :quantity_of_persons, null: false, default: 1, limit: 1
      t.references :restaurant, foreign_key: true
      t.timestamps
    end
  end
end
