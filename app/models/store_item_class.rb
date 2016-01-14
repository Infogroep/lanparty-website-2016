class StoreItemClass < ActiveRecord::Base
  belongs_to :parent, class_name: "StoreItemClass"
  has_many :children, class_name: "StoreItemClass", foreign_key: :parent_id
  has_many :pricing_overrides, as: :payable, dependent: :destroy
  has_many :store_items

  validates :name, presence: true
  validate :cant_be_own_parent

  def apply_pricing_overrides(pricing_default, original_price, cumulative_price)
    override = pricing_overrides.where(pricing_default: pricing_default).first

    parents_overridden_price = recurse_pricing_overrides(pricing_default, original_price, cumulative_price)

    if override
      override.apply_transform(original_price, parents_overridden_price)
    else
      parents_overridden_price
    end
  end

  def recurse_pricing_overrides(pricing_default, original_price, cumulative_price)
    if parent
      parent.apply_pricing_overrides(pricing_default, original_price, cumulative_price)
    else
      cumulative_price
    end
  end

  def cant_be_own_parent
    errors.add(:parent, "Can't be its own parent") if parent == self
  end
end
