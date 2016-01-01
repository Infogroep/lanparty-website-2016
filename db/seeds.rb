# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
PricingDefault.create name: '__FALLBACK__', priority: 0, transform: "cprice * p('1.75')", description: 'Price transform used when user does not belong to any group. Do not delete.'
