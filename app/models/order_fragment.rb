class OrderFragment < ActiveRecord::Base
  belongs_to :order

  has_many :order_items, dependent: :destroy

  enum status: [:open, :pending, :accepted, :completed]

  def total_price
    order_items.map { |order_item| order_item.price }.reduce(BigDecimal.new("0"),:+)
  end

  def total_item_count
    order_items.map { |order_item| order_item.count }.reduce(0,:+)
  end

  def add_item(item)
    existing_order_item = order_items.where(store_item: item).first

    if existing_order_item
      existing_order_item.count += 1
      existing_order_item.save!
    else
      new_order_item = OrderItem.create!(count: 1, store_item: item))
      order_items << new_order_item
      # TODO: Remove this i think. check it first though
      save!
    end
  end

  # TODO: Move this to controllers?
  def scan_item(barcode_str)
    raise WebsiteErrors::BarcodeNotFoundError.new(barcode_str) unless (barcode = Barcode.find_by code: barcode_str)

    add_item(barcode.store_item)
  end

  def add_item_by_id(store_item_id)
    raise WebsiteErrors::UserFriendlyError.new("Store item not found") unless (item = StoreItem.find(store_item_id))

    add_item(item)
  end

  def place
    raise WebsiteErrors::UserFriendlyError.new("Can only place open orders") unless open?

    self.placed_at = Time.now
    self.pending!
  end

  def pay!
    raise WebsiteErrors::UserFriendlyError.new("Can only pay open or pending orders") unless open? or pending?

    self.with_lock do
      client = order.user
      client.lock!

      client.account_balance -= self.total_price
      client.save!

      self.order_items.each do |order_item|
        order_item.decrease_stock!
        order_item.lock_price!
      end

      self.payed_at = Time.now
      self.completed!
      self.save!
    end
  end

end
