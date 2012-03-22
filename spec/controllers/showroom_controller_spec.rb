require 'spec_helper'

describe ShowroomController do

  before(:each) do
    @showroom = Factory(:showroom)
    10.times do
      @showroom.products << Factory(:product)
    end
  end

  it "#show should not be successfull" do

    get :show, :id => @showroom.products.first.id
    response.should redirect_to(new_user_session_path)
  end

  it "#show should be successfull" do
    sign_in(Factory(:user))
    get :show, :id => @showroom.products.first.id
    response.should be_success
  end

end
