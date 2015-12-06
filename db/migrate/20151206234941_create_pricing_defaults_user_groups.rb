class CreatePricingDefaultsUserGroups < ActiveRecord::Migration
  def change
    create_table :pricing_defaults_user_groups, index: false do |t|
      t.references :pricing_default, index: true, foreign_key: true, null: false
      t.references :user_group, index: true, foreign_key: true, null: false
    end
  end
end
