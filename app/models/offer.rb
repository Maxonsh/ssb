class Offer < ApplicationRecord
  OFFER_TYPES = %w(Sell Rent).freeze

  has_one :property, :inverse_of => :offer, :foreign_key => :offer_id
  accepts_nested_attributes_for :property

  has_one :property_gallery, :through => :property

  scope :by_type, ->(type) { where('type = ?', type) }
  scope :by_price_range, lambda { |min_price, max_price|
    where('price <= :max_price AND price >= :min_price',
          :min_price => min_price, :max_price => max_price)
  }
  scope :by_address, lambda { |address|
    joins(:property).where('properties.address like ?', "%#{address}%")
  }

  validates :description, :price, :presence => true
  validates :price, :numericality => { :only_integer => true }
end
