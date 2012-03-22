require 'spec_helper'

describe ProductsController do

  context "#index" do
    it "should not be successfull" do
      get :index
      response.should redirect_to(new_user_session_path)
    end

    it "should be successfull" do
      sign_in(Factory(:admin))
      get :index
      response.should be_success
    end
  end

  context "#show" do

    before(:each) do
      @product = Factory(:product)
    end

    it "should not be successfull" do
      get :show, :id => @product.id
      response.should redirect_to(new_user_session_path)
    end

    it "should be successfull" do
      sign_in(Factory(:admin))
      get :show, :id => @product.id
      response.should be_success
    end
  end

  context "#new" do
    it "should not be successfull" do
      get :new
      response.should redirect_to(new_user_session_path)
    end

    it "should be successfull" do
      sign_in(Factory(:admin))
      get :new
      response.should be_success
    end
  end

  context "#create" do
    it "should not be successfull" do
      post :create, :product => Factory.attributes_for(:product)
      response.should redirect_to(new_user_session_path)
    end

    it "should be successfull" do
      sign_in(Factory(:admin))
      lambda {
        post :create, :product => Factory.attributes_for(:product)
      }.should change(Product, :count).by(1)
      #response.should be_success
    end
  end

end
