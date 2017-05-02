class Offer < ApplicationRecord
  OFFER_TYPES = %w(Sell Rent Swap).freeze
  PERIOD_TYPES = %w(Daterange Week Month Year Flexible Permanently Other).freeze

  belongs_to :property
  accepts_nested_attributes_for :property

  has_one :property_gallery, :through => :property
  has_one :user, :through => :property

  scope :by_type, ->(type) { where('type = ?', type) }
  scope :by_price_range, lambda { |min_price, max_price|
    where('price <= :max_price AND price >= :min_price',
          :min_price => min_price, :max_price => max_price)
  }
  scope :by_address, lambda { |address|
    joins(:property).where('properties.address like ?', "%#{address}%")
  }

  validates :description, :presence => true
  validates :period, :presence => true, :if => :with_period?

  def with_period?
    OFFER_TYPES[1..2].include? type
  end
end
