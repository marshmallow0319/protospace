class Prototypes::NewestController < ApplicationController
  def index
    @prototype = Prototype.includes(:photos).order("created_at DESC").page(params[:page]).per(12)
    render "prototypes/index"
  end
end
