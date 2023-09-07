class RenameTypeToCategoryInAccommodations < ActiveRecord::Migration[7.0]
  def change
    rename_column :accommodations, :type, :category
  end
end
