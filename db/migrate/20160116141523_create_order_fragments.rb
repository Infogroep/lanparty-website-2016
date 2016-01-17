class CreateOrderFragments < ActiveRecord::Migration
  def change
    create_table :order_fragments do |t|
      t.references :order, index: true, foreign_key: true, null: false
      t.integer :status, default: 0, null: false
      t.decimal :locked_price, precision: 8, scale: 2

      t.timestamps null: false
    end
  end
end
