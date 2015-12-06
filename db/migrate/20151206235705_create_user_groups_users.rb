class CreateUserGroupsUsers < ActiveRecord::Migration
  def change
    create_table :user_groups_users, id: false do |t|
      t.references :user_group, index: true, foreign_key: true, null: false
      t.references :user, index: true, foreign_key: true, null: false
    end
  end
end
