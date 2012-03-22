class ShowroomController < ApplicationController
  before_filter :is_regular_user?
  before_filter :get_current_showroom


  def show
    @product = @showroom.products.find params[:id]
    return (redirect_to root_path) unless @product
  end

  private

  def get_current_showroom
    @showroom = current_user.showrooms.current
  end

end
