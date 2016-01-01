class PricingOverride < ActiveRecord::Base
  include PricingTransform

  belongs_to :payable, polymorphic: true
  belongs_to :pricing_default

  validates :payable, presence: true
  validates :pricing_default_id, uniqueness: { scope: [:payable_id, :payable_type] }
  validates :payable_id, uniqueness: { scope: [:pricing_default_id, :payable_type] }
end
