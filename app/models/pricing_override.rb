class PricingOverride < ActiveRecord::Base
  belongs_to :payable, polymorphic: true
  belongs_to :pricing_default
end
