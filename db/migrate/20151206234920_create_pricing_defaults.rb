class CreatePricingDefaults < ActiveRecord::Migration
  def change
    create_table :pricing_defaults do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.text :transform, null: false
      t.integer :priority, null: false

      t.timestamps null: false
    end
  end
end
