class Sell < Offer

  scope :ordered_by_created_at_asc,  -> { order(:created_at => :asc) }
  scope :ordered_by_created_at_desc, -> { order(:created_at => :desc) }
end
