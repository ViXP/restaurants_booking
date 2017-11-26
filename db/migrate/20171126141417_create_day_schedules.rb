class CreateDaySchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :day_schedules do |t|
      t.integer :day_of_week, null: false, limit: 1
      t.integer :open_time, default: 0
      t.integer :close_time, default: 0
      t.references :restaurant, foreign_key: true
      t.timestamps
    end
  end
end
