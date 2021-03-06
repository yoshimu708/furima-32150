class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @purchase = Purchase.all
    @message = Message.new
    @messages = @item.messages.includes(:user)
  end

  def edit
    redirect_to action: :index unless current_user.id == @item.user.id
    if @item.purchase
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @item.user_id
      @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  def search
    unless user_signed_in?
      redirect_to action: :index
    end
    @items = Item.search(params[:keyword])
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :image, :explanation, :category_id, :status_id, :delivery_fee_id, :shipment_source_id, :estimated_arrival_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
