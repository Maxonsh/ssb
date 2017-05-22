# class for search
class SearchService
  def call(params)
    %i(
      filter_by_type
      filter_by_address
      filter_by_price_range
      filter_by_property_type
      filter_by_minimum_land_area
      filter_by_property_parameters
    ).inject(::Offer.includes(:property)) { |offers, method| send method, offers, params }
  end

  private

  def filter_by_type(offers, params)
    return offers if params[:type].blank?

    offers.joins(:property)
          .where('type = ?', params[:type])
  end

  def filter_by_address(offers, params)
    return offers if params[:type].blank?

    offers.joins(:property)
          .where('properties.address like ?', "%#{params[:address]}%")
  end

  def filter_by_price_range(offers, params) # rubocop:disable AbcSize
    return offers if params[:min_price].blank? && params[:max_price].blank?

    if params[:min_price].present? && params[:max_price].blank?
      search_by_min_price(offers, params[:min_price])
    elsif params[:min_price].blank? && params[:max_price].present?
      search_by_max_price(offers, params[:max_price])
    else
      search_by_price_range(offers, params[:min_price], params[:max_price])
    end
  end

  def search_by_min_price(offers, min_price)
    offers.where('price >= :min_price', :min_price => min_price)
  end

  def search_by_max_price(offers, max_price)
    offers.where('price <= :max_price', :max_price => max_price)
  end

  def search_by_price_range(offers, min_price, max_price)
    offers.where('price <= :max_price AND price >= :min_price',
                 :min_price => min_price,
                 :max_price => max_price)
  end

  def filter_by_property_type(offers, params)
    return offers if params[:property_types].blank?

    offers.joins(:property).where('properties.property_type IN (?)',
                                  params[:property_types].split(','))
  end

  def filter_by_minimum_land_area(offers, params)
    return offers if params[:minimum_land_area].blank?

    offers.joins(:property).where('properties.land_area >= :minimum_land_area',
                                  :minimum_land_area => params[:minimum_land_area])
  end

  def filter_by_property_parameters(offers, params)
    return offers if params[:additional_parameters].blank?

    additional_parameters = params[:additional_parameters].split(',')

    Property::ADDITIONAL_PARAMETERS.each do |parameter|
      next unless additional_parameters.include? parameter

      return offers.joins(:property).where("properties.#{parameter} = 't'")
    end
  end
end
