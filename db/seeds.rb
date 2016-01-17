# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
PricingDefault.create! name: '__FALLBACK__', priority: 0, transform: "cprice * p('1.75')", description: 'Price transform used when user does not belong to any group. Do not delete.'



# Debug seeds
if Rails.env.development?
  food = StoreItemClass.create! name: 'Food'
  drinks = StoreItemClass.create! name: 'Drinks'
  snacks = StoreItemClass.create! name: 'Snacks', parent: food

  StoreItem.create! name: 'Lasagna', purchase_price: 1.6, store_item_class: food, stock: 34
  StoreItem.create! name: 'Fries', purchase_price: 0.10, store_item_class: food, stock: 76
  StoreItem.create! name: 'Snickers', purchase_price: 0.4, store_item_class: snacks, stock: 54
  StoreItem.create! name: 'Fanta', purchase_price: 0.5, store_item_class: drinks, stock: 435
  StoreItem.create! name: 'Cola', purchase_price: 0.5, store_item_class: drinks, stock: 634
  StoreItem.create! name: 'Sprite', purchase_price: 0.5, store_item_class: drinks, stock: 245
end