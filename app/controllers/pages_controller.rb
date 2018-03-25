class PagesController < ApplicationController
  def index
  	if params[:order]
       @posts = Post.where(publish: true).paginate(page: params[:page]).order(created_at: params[:order])
    else
      @posts = Post.where(publish: true).paginate(page: params[:page]).order(created_at: :desc)
    end
  end

  def about
  end

  def contact
  end
end
