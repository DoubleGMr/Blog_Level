class TagsController < ApplicationController

	before_action :logged_in_user
  	before_action :admin_user

  def new
  	@tags = Tag.all
  	@tag = Tag.new
  end

  def create
  	@tag = Tag.new(tag_params)
  	@tag.user_id = current_user.id
  	if @tag.save
  		flash[:success] = "#{@tag.name} 标签创建成功."
  	else
  		flash[:danger] = "因错误创建失败."
  	end
  	redirect_to root_url
  end

  def edit
  	@tag = Tag.find(params[:id])
  end

  def update
  	@tag = Tag.find(params[:id])
  	if @tag.update_attributes(tag_params)
  		flash[:success] = "标签资料更新成功."
  	else
  		flash[:danger] = "标签资料更新失败."
  	end
  	redirect_to root_url
  end

  def destroy
  	Tag.find(params[:id]).destroy
  	flash[:danger] = "标签删除成功."
  	redirect_to root_url
  end

  private

  def tag_params
  	params.require(:tag).permit(:name,:introduce)
  end
end
