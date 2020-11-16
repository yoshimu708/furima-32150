class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  def index
  end

  def new
  end

  private

  def item_params
    params.require(:items).permit(:content,:image).merge(user_id: current_user.id)
  end

end
