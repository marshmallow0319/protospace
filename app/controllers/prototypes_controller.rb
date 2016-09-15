class PrototypesController < ApplicationController
  def index
  end

  def new
    @prototype = Prototype.new
    @prototype.photos.build
  end

  def create
    @prototype = Prototype.create(prototype_params)
    if @prototype.save
      flash[:notice] = "投稿が成功しました"
      redirect_to root_path
    else
      flash[:notice] = "入力内容が正しくありません"
      render :new
    end
  end

  def show
  end

  private

  def prototype_params
    params.require(:prototype).permit(:id, :title, :catch, :concept, photos_attributes: [:id, :prototype_id, :content, :status]).merge(user_id: current_user.id)
  end
end
