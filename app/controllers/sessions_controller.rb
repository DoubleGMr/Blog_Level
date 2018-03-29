class SessionsController < ApplicationController

  layout 'session',only:[:new,:create]
  
  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
  		if user.activated?
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        if user.admin?
          redirect_to dashboard_index_url
        else
          redirect_to user
        end
      else
        message  = "账号没有正确激活, "
        message += "请检查你邮箱中的激活文件"
        flash[:warning] = message
        redirect_to root_url
      end
  	else
  		flash.now[:danger] = '填写的邮箱/密码中存在错误!'
  		render 'new'
  	end
  end

  def destroy
  	log_out if logged_in?
  	redirect_to root_url
  end
end
