class RepliesController < ApplicationController

  before_action :logged_in_user

  def create
  	@reply = Reply.new(reply_params)
    @reply.user_id = current_user.id
    if @reply.save
      flash[:success] = "回复提交成功."
    else
      flash[:danger] = "请输入正确内容."
    end
     redirect_back(fallback_location: posts_path)
  end

  private

  def reply_params
  	params.require(:reply).permit(:content,:comment_id)
  end

end
