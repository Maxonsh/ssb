class OffersController < ApplicationController
  helper_method :resource_offer

  def index
    @offers =
      ::SearchService.new.call(params).paginate(:page => params[:page], :per_page => 5)
  end

  def new
    @resource_offer = offer_klass.new
    property = @resource_offer.build_property
    user = property.build_user
    user.build_company
    property.build_property_gallery
  end

  def create
    @resource_offer = offer_klass.new(offer_params)
    @resource_offer.status = 'new' # временно пока не запилю стейт машину
    @resource_offer.user = current_user if current_user

    if @resource_offer.save
      redirect_to offer_path(@resource_offer), :notice => 'Offer created'
    else
      flash.now[:error] = 'Offer not created'
      render :new
    end
  end

  def edit; end

  def update
    if resource_offer.update_attributes(offer_params)
      redirect_to offer_path(resource_offer), :notice => 'Offer updated'
    else
      flash.now[:error] = 'Offer not updated'
      render(:edit)
    end
  end

  def show; end
end

private

def resource_offer
  @resource_offer ||= Offer.find(params[:id])
end

def offer_params # rubocop:disable MethodLength
  params.require(offer_klass.name.underscore.to_sym)
        .permit(
          :description,
          :price,
          :status,
          :period,
          :type,
          :rent_confirm,
          :rent_period,
          :rent_price,
          :property_attributes => [:id,
                                   :address,
                                   :bedrooms,
                                   :bathrooms,
                                   :car_spaces,
                                   :land_area,
                                   :floor_area,
                                   :latitude,
                                   :longitude,
                                   :property_type,
                                   :lounge_room,
                                   :kitchen,
                                   :dinning_room,
                                   :laundry,
                                   :on_sweet,
                                   :powder_room,
                                   :property_gallery_attributes => [{ :images => [] }],
                                   :user_attributes => [:email,
                                                        :company_attributes =>
                                                          [:abn_confirm, :abn, :name]]]
        )
end

def offer_klass
  raise unless params[:type].in? ::Offer::OFFER_TYPES
  params[:type].constantize
end
