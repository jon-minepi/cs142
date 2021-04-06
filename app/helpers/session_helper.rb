module SessionHelper
  def log_in(login)
    session[:user] = User.find_by(login: login)
  end
  
  def logged_in?
    session[:user].present?
  end

  def log_out
    session.delete(:user)
  end

  def logged_in_full_name
    session[:current_user].full_name
  end
end