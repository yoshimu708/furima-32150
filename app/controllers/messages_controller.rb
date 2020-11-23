class MessagesController < ApplicationController
  def create
   @message = Message.new(message_params)
    if @message.save
      redirect_to item_path(@message.item) 
    else
      @message = @message.item
      @messages = @item.messages
      render item_path
    end
  end

  private
  def message_params
    params.require(:message).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
