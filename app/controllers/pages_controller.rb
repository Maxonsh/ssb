class PagesController < ApplicationController
  def main
    @main_page_sell_offers = Sell.ordered_by_created_at_asc.last 3
    @main_page_rent_offers = Rent.ordered_by_created_at_asc.last 3
  end
end
