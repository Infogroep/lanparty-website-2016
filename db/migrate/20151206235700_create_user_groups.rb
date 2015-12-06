class CreateUserGroups < ActiveRecord::Migration
  def change
    create_table :user_groups do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.references :pricing_override, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
