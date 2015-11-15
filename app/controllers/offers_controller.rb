class OffersController < ApplicationController
  def index
    if valid_response?
      render :index, locals: { offers: offers }
    else
      flash[:notice] = 'Invalid response'
      redirect_to root_path
    end
  end

  private

  def valid_response?
    api_response.has_key?(:offers)
  end

  def offers
    OffersDecorator.new(api_response[:offers])
  end

  def api_response
    @api_response ||= Api::Offer.new(offers_params).call
  end

  def offers_params
    params.permit(:uid, :pub0, :page).symbolize_keys
  end
end
