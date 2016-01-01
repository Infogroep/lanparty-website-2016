class Barcode < ActiveRecord::Base
  belongs_to :store_item

  validates :code, presence: true, uniqueness: true
  validates :store_item, presence: true
end
