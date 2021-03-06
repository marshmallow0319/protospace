class PrototypesController < ApplicationController
  before_action :set_prototype, only: [:edit, :show, :update, :destroy]

  def index
    @prototype = Prototype.includes(:photos).order("likes_count DESC").page(params[:page]).per(12)
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
    @like = @prototype.likes(params[:id])
    @likes = @prototype.likes_count
    @comment = Comment.new
    @comments = @prototype.comments_count
  end

  def edit
    @subphotos = @prototype.photos.sub
    (2 - @subphotos.count).times { @subphotos << @prototype.photos.build(status: "sub") }
  end

  def update
    if @prototype.update(prototype_params)
      flash[:notice] = "編集が成功しました"
      redirect_to root_path
    else
      flash[:notice] = "入力内容が正しくありません"
      render :edit
    end
  end

  def destroy
    if @prototype.destroy
      flash[:notice] = "削除しました"
      redirect_to root_path
    else
      flash[:notice] = "入力内容が正しくありません"
      render :show
    end
  end

  private

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end


  def prototype_params
    params.require(:prototype).permit(:id, :title, :catch, :concept, photos_attributes: [:id, :prototype_id, :content, :status]).merge(user_id: current_user.id, tag_list: params[:prototype][:tag])
  end
end
