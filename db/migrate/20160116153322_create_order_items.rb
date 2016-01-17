class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.references :store_item, index: true, foreign_key: true, null: false
      t.references :order_fragment, index: true, foreign_key: true, null: false
      t.integer :count, default: 0, null: false

      t.timestamps null: false
    end
  end
end
