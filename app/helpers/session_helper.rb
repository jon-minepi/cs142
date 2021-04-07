module SessionHelper
  def log_in(login)
    @user = User.find_by(login: login)
    session[:user] = @user
  end

  def logged_in?
    session[:user].present?
  end

  def log_out
    session.delete(:user)
    @user = nil
  end

  def current_user_name
    @user[:first_name]
  end

  def current_user_id
    @user[:id]
  end
  def current_user
    @user
  end
end