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
    # TODO: check for user not found
    @user = User.find_by(login: params[:login])
    if @user.password_valid? params[:password]
      log_in(params[:login])
      redirect_to @user
    else
      redirect_to users_login_path, notice: "Invalid password"
    end
  end

  def logout
    log_out
    redirect_to users_login_path
  end

  def new
    @user = User.new
  end

  def create
    unless params[:user][:password1] == params[:user][:password2]
      redirect_to users_new_path, notice: "Passwords do not match"
      return
    end
    @user = User.new(user_params)
    @user.salt = rand(1024)
    @user.password_digest = @user.generate_password_digest(params[:user][:password1], @user.salt)
    if @user.save
      redirect_to users_login_path, notice: "Registration Successful"
    else
      render :new, status: :unprocessable_entity, notice: "Registration failed, please check fields and try again"
    end
  end

  private
  def user_params
    params.require(:user).permit(:login, :first_name, :last_name)
  end
end
