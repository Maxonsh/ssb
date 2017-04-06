class OffersController < ApplicationController
  def index
    @offers =
      ::SearchService.new(params).find_offers.paginate(:page => params[:page], :per_page => 5)
  end

  def new
    @resource_offer = offer_klass.new
    @resource_offer.build_property
  end

  def create
    @resource_offer = offer_klass.new(offer_params)
    @resource_offer.status = 'new' # временно пока не запилю стейт машину

    if @resource_offer.save
      redirect_to offer_path(@resource_offer), :notice => 'Offer created'
    else
      flash.now[:error] = 'Offer not created'
      render :new
    end
  end

  def show; end
end

private

def resource_offer
  @resource_offer ||= Offer.find(params[:id])
end

def offer_params
  params.require(offer_klass.name.underscore.to_sym)
        .permit(
          :description,
          :price,
          :status,
          :type,
          :property_attributes => [:address, :latitude, :longitude]
        )
end

def offer_klass
  raise unless params[:type].in? ::Offer::OFFER_TYPES
  params[:type].constantize
end
