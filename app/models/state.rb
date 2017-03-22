class State < ApplicationRecord
  has_many :properties, :inverse_of => :state, :foreign_key => :state_id
end
