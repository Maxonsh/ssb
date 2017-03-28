class WelcomeController < ApplicationController
  def index
    @main_page_sell_offers = Sell.order(:created_at => :asc).last 3
    @main_page_rent_offers = Rent.order(:created_at => :desc).last 3
  end
end
