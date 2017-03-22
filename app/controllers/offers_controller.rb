class OffersController < ApplicationController
  def new
    @resource_offer = offer_type.new
    @resource_offer.type = params[:type]
  end

  def create
    @resource_offer = offer_type.new(offer_params)
    @resource_offer.status = 'new' # temp

    if @resource_offer.save
      redirect_to offer_path(@resource_offer), :notice => 'Offer created'
    else
      flash.now[:error] = 'Offer not created'
      render 'new'
    end
  end

  def show; end
end

private

def resource_offer
  @resource_offer ||= Offer.find(params[:id])
end

def offer_params
  params.require(offer_type.name.underscore.to_sym).permit(:description, :price, :status, :type)
end

def offer_type
  params[:type].constantize if params[:type].in? ::Offer::OFFER_TYPES
end
