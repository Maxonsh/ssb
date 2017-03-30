class Property < ApplicationRecord
  belongs_to :offer, :foreign_key => :offer_id

  validates :country, :address, :presence => true
end
