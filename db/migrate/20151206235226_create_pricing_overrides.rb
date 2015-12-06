class CreatePricingOverrides < ActiveRecord::Migration
  def change
    create_table :pricing_overrides do |t|
      t.text :transform, null: false
      t.references :payable, index: true, foreign_key: true, null: false
      t.references :pricing_default, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
