class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :show, :update]

  def edit
  end

  def show
    @prototypes = @user.prototypes.includes(:photos).order("created_at DESC").page(params[:page]).per(8)
  end

  def update
    if @user.update(update_params)
      bypass_sign_in @user
      flash[:notice] = "編集が成功しました"
      redirect_to root_path
    else
      flash[:notice] = "入力内容が正しくありません"
      render :edit
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def update_params
    params.require(:user).permit(:id, :username, :email, :password, :avatar, :member, :profile, :works)
  end

end
