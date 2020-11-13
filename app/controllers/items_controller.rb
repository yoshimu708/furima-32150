class ItemsController < ApplicationController
  def index
  end

  private

  def item_params
    params.require(:items).permit(:content,:image).merge(user_id: current_user.id)
  end
  
end
