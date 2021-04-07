module SessionHelper
  def log_in(login)
    session[:user] = User.find_by(login: login)[:id]
  end

  def logged_in?
    session[:user].present?
  end

  def log_out
    session.delete(:user)
  end

  def current_user_name
    begin
      User.find(session[:user])[:first_name]
    rescue ActiveRecord::RecordNotFound
      "Unknown"
    end
  end

  def current_user_id
    session[:user]
  end

  def current_user
    User.find(session[:user])
  end
end