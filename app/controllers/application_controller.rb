class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery 

  def authorize_superadmin
    redirect_to root_path, alert: 'Access Denied' unless current_user.superadmin?
  end
end
