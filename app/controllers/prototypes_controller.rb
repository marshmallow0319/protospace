class PrototypesController < ApplicationController
  def index
  end

  def new
    @prototype = Prototype.new
    @prototype.photos.build
  end

  def create
    @prototype = Prototype.create(prototype_params)
    redirect_to root_path
  end

  def show
  end

  private

  def prototype_params
    params.require(:prototype).permit(:id, :title, :catch, :concept, photos_attributes: [:id, :prototype_id, :content, :status]).merge(user_id: current_user.id)
  end
end
