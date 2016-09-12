class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :show, :update]

  def index
  end

  def edit
  end

  def show
  end

  def update
    if @user.update(update_params)
      bypass_sign_in @user
      redirect_to root_path
      flash[:notice] = "編集が成功しました"
    else
      render :edit
      flash[:notice] = "入力内容が正しくありません"
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def update_params
    params.require(:user).permit(:id, :username, :email, :password, :member, :profile, :works)
  end

end
