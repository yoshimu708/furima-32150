class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  def index
    @purchase = PurchaseStreet.new
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id
     redirect_to root_path
    end

    if @item.purchase
      redirect_to root_path
    end
    #フォームオブジェクトのインスタンスを生成し、インスタンス変数に代入する
    @purchase = PurchaseStreet.new
  end

  def create
    @purchase = PurchaseStreet.new(purchase_params)
    # binding.pry
    if @purchase.valid?
      @purchase.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_street).permit(:phone_number,:post_code,:adress,:municipal_district,:building,:prefecture_id).merge(item_id:params[:item_id],user_id: current_user.id)
  end
end
