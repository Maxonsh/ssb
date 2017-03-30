# class for search
class SearchService
  def initialize(params)
    @type = params[:type]
    @min_price = params[:min_price]
    @max_price = params[:max_price]
  end

  def find_offers
    offers = ::Offer.includes(:property)
    offers = offers.by_type(@type) if @type
    offers = offers.by_price_range(@min_price, @max_price) if price_range_present
    offers
  end

  def price_range_present
    @max_price && @min_price
  end
end
