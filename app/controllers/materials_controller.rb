class MaterialsController < ApplicationController
  def index
    @materials = Material.includes(:category).page params[:page]
  end
end
