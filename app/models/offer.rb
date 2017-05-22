class Offer < ApplicationRecord
  OFFER_TYPES = %w(Sell Rent Swap).freeze
  PERIOD_TYPES = %w(Daterange Week Month Year Flexible Permanently Other).freeze

  belongs_to :property
  accepts_nested_attributes_for :property

  has_one :property_gallery, :through => :property
  has_one :user, :through => :property

  validates :description, :presence => true
  validates :period, :presence => true, :if => :with_period?

  def with_period?
    OFFER_TYPES[1..2].include? type
  end
end
