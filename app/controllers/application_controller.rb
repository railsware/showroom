class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end
  
  # errors
  unless Rails.env.test?
    rescue_from ActionController::RoutingError,             :with => :not_found
    rescue_from AbstractController::ActionNotFound,         :with => :not_found
    rescue_from ActiveRecord::RecordNotFound,               :with => :not_found
  end
  
  
  private
  
  # 404 for errors
  def not_found
    render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
  end
  
  def is_user_admin?
    unless (current_user && "admin" == current_user.role)
      redirect_to root_url, :alert => "You dont have access to this page"
      return false
    else
      return true
    end
  end
  
  def is_regular_user?
    unless (current_user && "user" == current_user.role)
      redirect_to products_url
      return false
    else
      return true
    end
  end
  
end