module Commond
	extend ActiveSupport::Concern

	def post(order,tip,id)
		if order || tip
	      if order && !tip
	        @posts = Post.where(publish: true).unscoped.paginate(page: params[:page], per_page: 10).order(created_at: order)
	      elsif tip && !order
	        @type = tip
	        @posts = Post.where(publish: true, tag_id: id ).paginate(page: params[:page], per_page: 10)
	      else
	        @type = tip
	        @posts = Post.unscoped.where(publish: true, tag_id: id ).paginate(page: params[:page], per_page: 10).order(created_at: order)
	      end
	    else
	      @posts = Post.where(publish: true).paginate(page: params[:page], per_page: 10)
	    end
	end

end