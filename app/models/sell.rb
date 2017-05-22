class Sell < Offer
  attr_accessor :rent_confirm, :rent_price, :rent_period

  validates :rent_period, :rent_price, :presence => true, :if => :rent_confirm
  validates :price, :numericality => { :only_integer => true }, :if => :rent_confirm
  validates :price, :numericality => { :only_integer => true }
  validates :price, :presence => true

  after_commit :duplicate_for_rent, :if => :rent_confirm

  private

  def duplicate_for_rent
    self.rent_confirm = false

    rent_offer = dup
    rent_offer.price = rent_price
    rent_offer.period = rent_period
    rent_offer.type = 'Rent'
    rent_offer.property = property

    rent_offer.save!
  end
end
