class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end


  private

  def is_user_admin?
    unless (current_user && "admin" == current_user.role)
      redirect_to root_url, :alert => "You dont have access to this page"
      return false
    end
    true
  end

  def is_regular_user?
    unless (current_user && "user" == current_user.role)
      redirect_to products_url
      return false
    end
    true
  end

end
