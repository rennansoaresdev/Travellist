class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.references :trip, null: false, foreign_key: true
      t.text :description
      t.boolean :done

      t.timestamps
    end
  end
end
