class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  #确保用户已经登陆
  def logged_in_user
    unless logged_in?
      flash[:danger] = "请先登陆账号!"
      redirect_to login_url
    end
  end

  #确保是管理员
  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

end
