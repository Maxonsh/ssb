class Rent < Offer
  validates :price, :numericality => { :only_integer => true }
  validates :price, :presence => true
end
