class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :item_purchase_params, only: [:index,:create]

  def index
    @purchase = PurchaseStreet.new
    redirect_to root_path if current_user.id == @item.user_id || @item.purchase
    
    #@purchase = PurchaseStreet.new
  end

  def create
    @purchase = PurchaseStreet.new(purchase_params)
    if @purchase.valid?
      Payjp.api_key = ENV['PAYJP_SECRET_KEY'] 
      Payjp::Charge.create(
        amount: @item.price,
        card: purchase_params[:token], 
        currency: 'jpy'       
      )
      @purchase.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_street).permit(:phone_number, :post_code, :adress, :municipal_district, :building, :prefecture_id).merge(token: params[:token], item_id: params[:item_id], user_id: current_user.id)
  end

  def item_purchase_params
    @item = Item.find(params[:item_id])
  end
end
