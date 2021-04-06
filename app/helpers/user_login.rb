module UserLogin
  # get currently logged in user
  # set logged in user
  #
  def set_login_user
    @login_user = User.find(session[:login_user_id])
  end
  def logged_in?
    session[:loging_user_id].present?
  end

  def logged_in
    session[:login_user_id]
  end

  def login_user(login)
    session[:login] =
  end

  def logout_user!
    session.delete(:current_user)
  end

  def logged_in_full_name
    session[:current_user].full_name
  end
end