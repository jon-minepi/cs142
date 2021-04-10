class UsersController < ApplicationController
  include SessionHelper

  def index
    @users = User.all
  end

  def show
    @photos = Photo.where(user_id: params[:id])
    @user = User.find(params[:id])
  end

  def login
  end

  def post_login
    log_in(params[:login])
    redirect_to current_user
  end

  def logout
    log_out
    redirect_to users_login_path
  end

  def new

  end

  def create
end
