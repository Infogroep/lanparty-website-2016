json.extract! store_item, :id, :name, :stock
json.price store_item.price(current_user)
