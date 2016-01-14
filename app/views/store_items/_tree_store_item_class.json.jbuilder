json.extract! store_item_class, :id, :name
json.items store_item_class.store_items, partial: 'store_items/tree_store_item', as: :store_item
json.subclasses store_item_class.children, partial: 'store_items/tree_store_item_class', as: :store_item_class