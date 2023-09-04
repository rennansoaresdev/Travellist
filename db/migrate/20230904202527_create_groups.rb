class CreateGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :groups do |t|
      t.references :member, null: false, foreign_key: { to_table: :users }
      t.references :trip, null: false, foreign_key: true

      t.timestamps
    end
  end
end
