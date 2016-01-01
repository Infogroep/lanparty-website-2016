class UserGroup < ActiveRecord::Base
  include Authist::Authism

  belongs_to :pricing_override
  has_and_belongs_to_many :users
  # TODO: I really want this dependent
  has_and_belongs_to_many :pricing_defaults # , dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
