class UsersController < ApplicationController
  def index
    @users = User.all
  end
  def show
    @photos = Photo.where(user_id: params[:id])
    @user = User.find(params[:id])
  end

  def login
    # TODO login page
  end
  
  def post_login
    # TODO login action
  end

  def logout
    # TODO logout logic
    render :login
  end
end
