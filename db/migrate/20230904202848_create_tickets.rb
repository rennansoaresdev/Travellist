class CreateTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :tickets do |t|
      t.string :url
      t.datetime :start_time
      t.datetime :end_time
      t.string :origin
      t.string :destination
      t.string :seat
      t.string :gate
      t.decimal :price, precision: 8, scale: 2
      t.string :company_name
      t.references :user, null: false, foreign_key: true
      t.references :trip, null: false, foreign_key: true

      t.timestamps
    end
  end
end
