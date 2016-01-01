class PricingDefault < ActiveRecord::Base
  include PricingTransform

  has_and_belongs_to_many :user_groups
  has_many :pricing_overrides

  validates :name, presence: true, uniqueness: true
  validates :priority, presence: true

  def self.find_best_pricing_default(user)
    user.user_groups.map { |group| group.pricing_defaults }.flatten.sort { |pricing1, pricing2| pricing1.priority - pricing2.priority }.first || fallback_default
  end

  def self.fallback_default()
    PricingDefault.find_by name: '__FALLBACK__'
  end
end
