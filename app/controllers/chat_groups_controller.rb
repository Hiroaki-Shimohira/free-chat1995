class ChatGroupsController < ApplicationController
  before_action :authenticate_user!
  def index
    @chat_groups = current_user.chat_groups
  end

  def new
    @chat_group = ChatGroup.new
  end
  def create
    binding.pry
    @chat_group = ChatGroup.new(chat_group_params)
    if @chat_group.save
       redirect_to root_path, notice: 'グループが作成されました。'
    else
       render :new, alert: "失敗"
    end

  end
  def show
  end

  def edit
  end

  def update
    if ChatGroup.update(chat_group_params)
      redirect_to root_path , notice: "チャットグループが編集されました。"
    else
      render :edit, alert: "失敗"
    end
  end

  private
  def chat_group_params
    params.require(:chat_group).permit(:name, {user_ids: []})
  end
end
