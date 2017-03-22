class Offer < ApplicationRecord
  OFFER_TYPES = %w(Sell Rent).freeze

  has_one :property, :inverse_of => :offer, :foreign_key => :offer_id
  accepts_nested_attributes_for :property
end
