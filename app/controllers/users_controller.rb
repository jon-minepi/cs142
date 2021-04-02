class UsersController < ApplicationController
  def index
    @users = User.all
  end
  def show
    @photos = Photo.where(user_id: params[:id])
    @user = User.find(params[:id])
  end
end
