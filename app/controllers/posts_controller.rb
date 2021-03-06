class PostsController < ApplicationController

  include Commond

  before_action :get_name, only:[:show,:edit,:update]
  before_action :logged_in_user, except:[:show]
  before_action :admin_user, except:[:show]


  def index
    @tags = Tag.all
    id = Tag.where(name: params[:tip]).ids
    post(params[:order],params[:tip],id)
  end

  def new
  	@post = Post.new
  end

  def create
  	@post = Post.new(post_params)
  	@post.user_id = current_user.id
  	if @post.save
  		flash[:success] = "文章创建成功!"
  		redirect_to posts_url
  	else
  		flash[:danger] = "文章因某个错误创建失败!"
  		render 'new'
  	end
  end

  def edit
  end

  def update
  	if @post.update_attributes(post_params)
  		flash[:success] = "文章内容更新成功."
  		redirect_to posts_url
  	else
  		flash[:danger] = "某个错误的输入导致更新失败."
  		render 'edit'
  	end
  end

  def show
    @comment = Comment.new
    @reply = Reply.new
  end

  def destroy	
  	Post.friendly.find(params[:id]).destroy
  	flash[:success] = "成功删除目标文章."
  	redirect_back(fallback_location: posts_url)
  end

  private

   def post_params
   	params.require(:post).permit(:title,:content,:publish,:tag_id)
   end

   def get_name
    @post = Post.friendly.find(params[:id])
  end
end
