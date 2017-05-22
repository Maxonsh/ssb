class Property < ApplicationRecord
  PROPERTY_TYPES = [[%w(House LF), %w(Townhouse LF), %w(Villa LF)],
                    [%w(Apartment F), %w(Unit F), %w(Studio F)],
                    [%w(Land L), %w(Acreage L), %w(Rural L)],
                    [%w(Commercial F), %w(Industrial F), %w(Offices F),
                     %w(Retail F), %w(Hospitality F)].freeze].freeze

  ADDITIONAL_PARAMETERS = %w(lounge_room kitchen dinning_room laundry on_sweet powder_room).freeze

  geocoded_by :address
  reverse_geocoded_by :latitude, :longitude

  has_one :property_gallery
  accepts_nested_attributes_for :property_gallery

  has_many :offers
  belongs_to :user, :class_name => 'User', :foreign_key => :user_id
  accepts_nested_attributes_for :user

  validates :address, :property_type, :presence => true

  def with_coordinates?
    longitude.present? && latitude.present?
  end
end
