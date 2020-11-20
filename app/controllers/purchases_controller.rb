class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  def index
    @purchase = PurchaseStreet.new
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user_id

    redirect_to root_path if @item.purchase
    # フォームオブジェクトのインスタンスを生成し、インスタンス変数に代入する
    @purchase = PurchaseStreet.new
  end

  def create
    @purchase = PurchaseStreet.new(purchase_params)
    if @purchase.valid?
      Payjp.api_key = ENV['PAYJP_SECRET_KEY'] # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: Item.find(purchase_params[:item_id]).price, # 商品の値段
        card: purchase_params[:token], # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
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
end
