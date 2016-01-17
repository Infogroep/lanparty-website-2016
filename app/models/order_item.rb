class OrderItem < ActiveRecord::Base
  belongs_to :store_item
  belongs_to :order_fragment

  validates :order_fragment, presence: true
  validates :store_item, presence: true, uniqueness: { scope: :order_fragment }
  validates :count, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def price
    locked_price or unit_price * count
  end

  def unit_price
    store_item.price(order_fragment.order.user)
  end

  def out_of_stock?
    store_item.stock < count
  end

  def decrease_stock!
    store_item.with_lock do
      raise WebsiteErrors::UserFriendlyError.new("Out of stock for item #{store_item.name}") if out_of_stock?

      store_item.stock -= count
      store_item.save!
    end
  end

  def lock_price!
    with_lock do
      self.locked_price = price
      self.save!
    end
  end
end
