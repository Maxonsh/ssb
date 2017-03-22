class Property < ApplicationRecord
  belongs_to :offer, :foreign_key => :offer_id
end
