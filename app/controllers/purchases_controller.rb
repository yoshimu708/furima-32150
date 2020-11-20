class PurchasesController < ApplicationController

  def index
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
