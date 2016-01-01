class StoreItem < ActiveRecord::Base
  belongs_to :store_item_class
  has_many :barcodes, dependent: :destroy
  has_many :pricing_overrides, as: :payable, dependent: :destroy

  # TODO: Soft remove and scope: :removed, check original model.
  validates :name, presence: true, uniqueness: true # { scope: :removed }
  validates :purchase_price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :stock, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :store_item_class, presence: true

  # default_scope { where(removed: false) }

  def price(user)
    pricing_default = PricingDefault.find_best_pricing_default(user)

    if pricing_default
      calculate_overrides(pricing_default)
    else
      purchase_price
    end
  end

  def calculate_overrides(pricing_default)
    default_price = pricing_default.apply_transform(purchase_price, purchase_price)
    item_pricing_override = pricing_overrides.where(pricing_default: pricing_default).first

    class_overridden_price = store_item_class.apply_pricing_overrides(pricing_default, purchase_price, default_price)

    if item_pricing_override
      item_pricing_override.apply_transform(purchase_price, class_overridden_price)
    else
      class_overridden_price
    end
  end
end
