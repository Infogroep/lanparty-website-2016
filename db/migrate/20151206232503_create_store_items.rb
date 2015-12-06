class CreateStoreItems < ActiveRecord::Migration
  def change
    create_table :store_items do |t|
      t.string :name, null: false
      t.integer :stock, null: false
      t.references :store_item_class, index: true, foreign_key: true, null: false
      t.decimal :purchase_price, precision: 8, scale: 2, null: false

      t.timestamps null: false
    end
  end
end
