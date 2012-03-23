require 'spec_helper'

describe ShowroomController do

  before(:each) do
    @showroom = Factory(:showroom)
    10.times do
      @showroom.products << Factory(:product)
    end
    @showroom.user.showrooms.update_all({current: false}, ["showrooms.id != ?", [@showroom.id]])
  end

  it "#show should not be successfull" do
    get :show, :id => @showroom.products.first.to_param
    response.should redirect_to(new_user_session_path)
  end

  context "#show" do

    it "should be successfull" do
      sign_in(@showroom.user)
      get :show, :id => @showroom.products.first.to_param
      response.should be_success
    end

    it "should not be successfull for invalid product" do
      sign_in(@showroom.user)
      product = Factory(:product)
      get :show, :id => product.to_param
      response.should redirect_to(root_path)
    end

    it "should not be successfull for not signed in user" do
      get :show, :id => @showroom.products.first.to_param
      response.should redirect_to(new_user_session_path)
    end

    it "should not be successfull for signed in admin" do
      sign_in(Factory(:admin))
      get :show, :id => @showroom.products.first.to_param
      response.should redirect_to(products_path)
    end

  end

end
