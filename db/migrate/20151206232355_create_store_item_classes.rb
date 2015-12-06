class CreateStoreItemClasses < ActiveRecord::Migration
  def change
    create_table :store_item_classes do |t|
      t.string :name, null: false
      t.references :parent, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
