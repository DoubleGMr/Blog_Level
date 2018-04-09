class UsersController < ApplicationController

  before_action :get_id, only:[:show,:edit,:update]
  before_action :logged_in_user, only:[:index,:edit,:update,:destroy,:show]
  before_action :correct_user, only:[:edit,:update]
  before_action :admin_user, only:[:index,:destroy]

  layout 'session', only:[:new,:create,:edit,:update]

  def index
    if params[:order]
       @users = User.where(activated: true).paginate(page: params[:page]).order(created_at: params[:order])
    else
      @users = User.where(activated: true).paginate(page: params[:page]).order(created_at: :desc)
    end
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
    @reply = Reply.new
    redirect_to root_url and return unless @user.activated == true
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "用户账号更新成功!"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.friendly.find(params[:id]).destroy
    flash[:success] = "用户删除成功"
    redirect_to users_url
  end

  private

  def user_params
  	params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end

  def get_id
    @user = User.friendly.find(params[:id])
  end

    # 确保是正确的用户 
  def correct_user
    @user = User.friendly.find(params[:id])
    redirect_to(root_url) unless current_user?(@user) || current_user.admin
  end

end
