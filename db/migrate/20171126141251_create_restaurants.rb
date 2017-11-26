class CreateRestaurants < ActiveRecord::Migration[5.1]
  def change
    create_table :restaurants do |t|
      t.string :title, null: false, limit: 60
      t.text :description, limit: 300
      t.string :logo, limit: 400
      t.string :website, limit: 200
      t.timestamps
    end
  end
end
