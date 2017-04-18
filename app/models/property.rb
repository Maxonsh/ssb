class Property < ApplicationRecord
  PROPERTY_TYPES = %w(House Townhouse Apartment Brick Timber Eco Vacant\ Land Bedrooms Lounge
                      Dinning Kitchen Home\ Office Bathrooms Utility Garage Other).freeze

  geocoded_by :address
  reverse_geocoded_by :latitude, :longitude

  has_one :property_gallery
  accepts_nested_attributes_for :property_gallery

  belongs_to :offer, :foreign_key => :offer_id
  belongs_to :user, :class_name => 'User', :foreign_key => :user_id
  accepts_nested_attributes_for :user

  validates :address, :property_type, :presence => true
end
