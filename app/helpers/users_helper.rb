module UsersHelper

  def signed_in?
    !!session[:user_id]
  end

  def current_user_id
    session[:user_id] if signed_in?
  end
    
end
