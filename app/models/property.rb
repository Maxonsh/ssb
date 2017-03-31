class Property < ApplicationRecord
  geocoded_by :address
  reverse_geocoded_by :latitude, :longitude

  belongs_to :offer, :foreign_key => :offer_id

  validates :country, :address, :presence => true
end
