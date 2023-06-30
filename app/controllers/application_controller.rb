class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
  helper_method :login!, :logged_in?, :current_admin, :authorized_admin?, :logout!

  def login!
    session[:admin_id] = @admin.id
  end

  def logged_in?
    !!session[:admin_id]
  end

  def current_admin
    @current_admin ||= Admin.find_by(id: session[:admin_id]) if session[:admin_id]
  end

  def authorized_user?
     @admin == current_admin
  end

   def logout!
     session.clear
   end
end