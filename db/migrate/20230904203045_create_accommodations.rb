class CreateAccommodations < ActiveRecord::Migration[7.0]
  def change
    create_table :accommodations do |t|
      t.string :url
      t.datetime :checkin_time
      t.datetime :checkout_time
      t.decimal :price, precision: 8, scale: 2
      t.integer :capacity
      t.string :type
      t.string :name
      t.string :address
      t.references :user, null: false, foreign_key: true
      t.references :trip, null: false, foreign_key: true

      t.timestamps
    end
  end
end
