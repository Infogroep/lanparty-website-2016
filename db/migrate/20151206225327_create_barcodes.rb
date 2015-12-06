class CreateBarcodes < ActiveRecord::Migration
  def change
    create_table :barcodes do |t|
      t.string :code, null: false
      t.references :store_item, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
