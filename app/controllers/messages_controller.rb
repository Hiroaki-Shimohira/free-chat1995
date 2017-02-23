class MessagesController < ApplicationController
  def index
    @chat_groups = current_user.chat_groups
    @chat_group = ChatGroup.find(params[:chat_group_id])

    @message = Message.new
    @messages = @chat_group.messages

    # respond_to do |format|
    #   format.html { render :index }
    #   format.json { render json: @chat_group.messages }
    # end
  end

  # def create
  # #   @messages = Message.where(chat_group_id: params[:chat_group_id])
  # #   @message = current_user.messages.new(message_params)
  # #   if @message.save
  # #     respond_to do |format|
  # #       format.html{redirect_to :back}
  # #       format.json{render json: @message}
  # #     end
  # #   else
  # #     redirect_to root_path, notice: "失敗"
  # #   end
  # end

  private
  def message_params
    params.require(:message).permit(:body, :image).merge(chat_group_id: params[:chat_group_id])
  end
end
