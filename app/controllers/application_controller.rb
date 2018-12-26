class ApplicationController < ActionController::Base
  # Include Knock within your application.
  include Knock::Authenticable
  include Response
  include ExceptionHandler

  def return_unauthorized
    render status: :unauthorized
  end

  protected

  # Method for checking if current_user is admin or not.
=begin
  def authorize_as_admin
    return_unauthorized unless current_user_is_admin
  end

  def current_user_is_admin
    !current_user.nil? && current_user.is_admin?
  end
=end
end
