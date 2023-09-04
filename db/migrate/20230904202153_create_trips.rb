class CreateTrips < ActiveRecord::Migration[7.0]
  def change
    create_table :trips do |t|
      t.string :name
      t.date :start_date
      t.date :end_date
      t.string :destination
      t.decimal :budget_per_user, precision: 8, scale: 2
      t.references :owner, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
