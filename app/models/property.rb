class Property < ApplicationRecord
  geocoded_by :address
  reverse_geocoded_by :latitude, :longitude

  has_one :property_gallery
  accepts_nested_attributes_for :property_gallery

  belongs_to :offer, :foreign_key => :offer_id

  validates :address, :presence => true
end
