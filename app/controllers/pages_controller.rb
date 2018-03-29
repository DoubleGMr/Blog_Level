class PagesController < ApplicationController
  include Commond

  def index
    if !Ip.where(ip_address: request.remote_ip)
      Ip.create(ip_address: request.remote_ip)
    end
    @tags = Tag.all
    id = Tag.where(name: params[:tip]).ids
    post(params[:order],params[:tip],id)
  end

  def about
  end

  def contact
    @message = Message.new
  end
end
