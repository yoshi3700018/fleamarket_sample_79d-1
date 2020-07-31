class ProductsController < ApplicationController

  def index
  end

  def new
  end

  def create
  end

  def edit
  end
  
  def update
  end

  def show
    # @product = product.find(params[:id])
  end

  def destroy
  end

  def confirm
    card = Card.find_by(user_id: current_user.id)
    if card
      Payjp.api_key = Rails.application.credentials.development[:PAYJP_PRIVATE_KEY]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def top
  end

end
