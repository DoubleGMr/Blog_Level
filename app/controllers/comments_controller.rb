class CommentsController < ApplicationController

	before_action :logged_in_user

	def create
        @comment = Comment.new(comment_params)
        @comment.user_id = current_user.id
        if @comment.save
          flash[:success] = "评论发表成功."
        else
          flash[:danger] = "请输入正确内容."
        end
         redirect_back(fallback_location: posts_path)
	end

	private

	def comment_params
     params.require(:comment).permit(:content,:post_id)
   end
end
