class Order < ActiveRecord::Base
  belongs_to :user

  has_many :order_fragments, dependent: :destroy

  validates :user, presence: true
  validates :placed_at, presence: true, if: :pending?

  def total_price
    order_fragments.map { |order_fragment| order_fragment.price }.reduce(BigDecimal.new("0"),:+)
  end

  def total_item_count
    order_fragments.map { |order_fragment| order_fragment.count }.reduce(0,:+)
  end
end
