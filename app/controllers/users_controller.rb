class UsersController < ApplicationController

  def index
  end

  def edit
  end

  def show
    @username = current_user.username
    @member = current_user.member
    @profile = current_user.profile
    @works = current_user.works
  end

end
