class ItemsController < ApplicationController
  def index
    @items = Item.page params[:page]
  end
end
