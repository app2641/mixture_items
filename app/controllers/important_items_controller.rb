class ImportantItemsController < ApplicationController
  def index
    @important_items = ImportantItem.page params[:page]
  end
end
