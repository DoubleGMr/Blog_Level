class DashboardController < ApplicationController

  before_action :logged_in_user, except:[:show]
  before_action :admin_user, except:[:show]

  def index
  	@users = User.where(activated: true,admin: false)
  	@posts = Post.all
  	@tags = Tag.all
  	@messages = Message.all
  	@comments = Comment.all
  	@replies = Reply.all
    @ips = Ip.all
  end
end
