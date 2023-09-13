class ChangeGroupsToMembers < ActiveRecord::Migration[7.0]
  def change
    rename_column :groups, :member_id, :user_id
    rename_table :groups, :members
  end
end
