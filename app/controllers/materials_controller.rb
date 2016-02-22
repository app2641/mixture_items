class MaterialsController < ApplicationController
  def index
    @materials = Material.page params[:page]
  end
end
