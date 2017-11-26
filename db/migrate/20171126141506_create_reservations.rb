class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.date :reserve_date, null: false
      t.integer :reserve_start, null: false
      t.integer :reserve_end, null: false
      t.string :reserver_name, null: false, limit: 50
      t.references :dining_table, foreign_key: true
      t.timestamps
    end
  end
end
