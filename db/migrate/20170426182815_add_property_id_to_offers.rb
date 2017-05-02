class AddPropertyIdToOffers < ActiveRecord::Migration[5.0]
  def change
    add_reference :offers, :property, :foreign_key => true
    remove_reference :properties, :offer, :index => true
  end
end
