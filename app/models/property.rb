class Property < ApplicationRecord
  belongs_to :offer, :foreign_key => :offer_id
  belongs_to :state, :inverse_of => :properties, :foreign_key => :state_id
end
