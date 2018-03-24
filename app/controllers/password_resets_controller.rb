class PasswordResetsController < ApplicationController
  before_action :get_user, only: [:edit, :update]
  before_action :valid_user, only: [:edit, :update]
  before_action :check_expiration, only: [:edit, :update]

	layout 'session',only:[:new,:edit,:create,:update]

  def new
  end

  def create
  	@user = User.find_by(email: params[:password_reset][:email].downcase)
  	if @user
       @user.create_reset_digest
       @user.send_password_reset_email
       flash[:info] = "重设密码的邮件已经发送."
       redirect_to root_url
	  else
        flash.now[:danger] = "未成功发现账户,请检查."
		    render 'new'
	  end
  end

  def edit
  end

  def update
    if params[:user][:password].empty?
      @user.errors.add(:password, "密码不能为空!")
      render 'edit'
    elsif @user.update_attributes(user_params)
        log_in @user
        @user.update_attribute(:reset_digest, nil)
        flash[:success] = "密码重设成功."
        redirect_to @user
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end

  # 前置过滤器

  def get_user
    @user = User.find_by(email: params[:email])
  end

  # 确保是有效用户
  def valid_user
    unless (@user && @user.activated? && @user.authenticated?(:reset, params[:id]))
      redirect_to root_url
    end
  end

  # 检查重设令牌是否过期
  def check_expiration
    if @user.password_reset_expired?
       flash[:danger] = "密码重设申请已失效."
       redirect_to new_password_reset_url
    end 
  end

end
