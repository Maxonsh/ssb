class Offer < ApplicationRecord
  OFFER_TYPES = %w(Sell Rent).freeze

  has_one :property, :inverse_of => :offer, :foreign_key => :offer_id
  accepts_nested_attributes_for :property

  scope :ordered_by_created_at_asc,  -> { order(:created_at => :asc) }
  scope :ordered_by_created_at_desc, -> { order(:created_at => :desc) }

  scope :by_state, ->(state) { where('properties.state_id = ?', state) }
  scope :by_type, ->(type) { where('type = ?', type) }
  scope :by_price_range, lambda { |price_range|
    where('price <= :max_price AND price >= :min_price',
          :min_price => price_range.split(',')[0], :max_price => price_range.split(',')[1])
  }

  validates :description, :presence => true
  validates :price, :presence => true
  validates :price, :numericality => { :only_integer => true }
end
