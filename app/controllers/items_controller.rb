class ItemsController < ApplicationController
  def index
    @items = Item.includes(:category).page params[:page]
  end
end
