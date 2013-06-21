class ApplicationController < ActionController::Base
  protect_from_forgery



    private

  #  def current_user
   #   @current_user ||= User.find(session[:user_id]) if session[:user_id]
    #end



  def current_user
    @current_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
  end



    helper_method :current_user
  def authorize
    p "der User!!!"
    p current_user
    if current_user.nil?  then
      redirect_to login_url
    end
  end
end
