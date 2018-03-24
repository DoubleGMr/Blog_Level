class UsersController < ApplicationController

  before_action :logged_in_user, only:[:index,:edit,:update,:destroy]
  before_action :correct_user, only:[:edit,:update]
  before_action :admin_user, only:[:destroy]

  layout 'session', only:[:new,:create,:edit,:update]

  def index
     @users = User.where(activated: true).paginate(page: params[:page])
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
      @user.send_activation_email
      flash[:success] = "请登陆你的邮箱以激活账号."
      redirect_to root_url
  	else
  		render 'new'
  	end
  end

  def show
  	@user = User.find(params[:id])
    redirect_to root_url and return unless @user.activated == true
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "用户账号更新成功!"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "用户删除成功"
    redirect_to users_url
  end

  private

  def user_params
  	params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end

  # 前置过滤器

  #确保用户已经登陆
  def logged_in_user
    unless logged_in?
      flash[:danger] = "请先登陆账号!"
      redirect_to login_url
    end
  end

  # 确保是正确的用户 
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

  #确保是管理员
  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

end
