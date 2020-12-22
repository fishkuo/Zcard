module SessionsHelper
  def current_user
    if session[:user9527].present?
      @_user9487 ||= User.find_by(id: session[:user9527])
    else
      nil
    end
  end

  def user_signed_in?
    if current_user
      return true
    else
      return false
    end
  end
end
