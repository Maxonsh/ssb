class Offer < ApplicationRecord
  OFFER_TYPES = %w(Sell Rent).freeze

  has_many :properties, :foreign_key => :offer_id
end
