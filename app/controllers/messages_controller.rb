class MessagesController < ApplicationController
  def index
    @rooms = Room.all.order('created_at DESC')
  end

  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    if @message.save
      redirect_to room_path(@room)
    else
      render :create
    end
  end

  private

  def message_params
    params.require(:message).permit(:content).merge(user_id: current_user.id)
  end
end
