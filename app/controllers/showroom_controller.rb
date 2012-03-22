class ShowroomController < ApplicationController
  before_filter :is_regular_user?
  
  def index
  end
  
end
