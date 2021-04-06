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
    # TODO login action
    @user = log_in(params[:login])
    redirect_to @user
  end

  def logout
    # TODO logout logic
    log_out
    redirect_to user_login_path
  end
end
