class PricingOverride < ActiveRecord::Base
  belongs_to :payable
  belongs_to :pricing_default
end
