require 'active_support/concern'

module PricingTransform
  extend ActiveSupport::Concern

  included do
    validates :transform, presence: true
  end

  class_methods do

  end

  def p(price)
    BigDecimal.new(price)
  end

  def apply_transform(oprice, cprice)
    eval(self.transform)
  end
end
