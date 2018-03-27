class PagesController < ApplicationController
  include Commond

  def index
    @tags = Tag.all
    id = Tag.where(name: params[:tip]).ids
    post(params[:order],params[:tip],id)
  end

  def about
  end

  def contact
  end
end
