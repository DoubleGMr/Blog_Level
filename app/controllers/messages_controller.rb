class MessagesController < ApplicationController

  before_action :logged_in_user,only: [:index,:show,:destroy,:delete_all]
  before_action :admin_user,only: [:index,:show,:destroy,:delete_all]

  def index
    @messages = Message.all.paginate(page: params[:page])
  end

  def create
  	@message = Message.new(message_params)
  	if @message.save
  		flash[:success] = "信息发送成功."
  	else
  		flash[:danger] = "信息发送失败,请确认邮箱地址并重新发送."
  	end
  	 redirect_back(fallback_location: contact_path)
  end

  def destroy
    Message.find(params[:id]).destroy
    flash[:success] = "该信息已成功删除."
    redirect_back(fallback_location: messages_path)
  end

  def delete_all
    Message.delete_all
    flash[:success] = "成功删除全部信息."
    redirect_back(fallback_location: messages_path)
  end

  private

  def message_params
  	params.require(:message).permit(:email,:name,:introduce,:content)
  end
end
