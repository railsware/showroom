class ShowroomController < ApplicationController
  before_filter :is_regular_user?
  
  def index
    @showroom = current_user.showrooms.current
  end
  
end
