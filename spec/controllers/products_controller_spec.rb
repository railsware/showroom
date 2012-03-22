require 'spec_helper'

describe ProductsController do

  context "#index" do
    it "should not be successfull for not signed in visitor" do
      get :index
      response.should redirect_to(new_user_session_path)
    end

    it "should not be successfull for signed in user" do
      sign_in(Factory(:user))
      get :index
      response.should redirect_to(root_path)
    end

    it "should be successfull for admin" do
      sign_in(Factory(:admin))
      get :index
      response.should be_success
    end
  end

  context "#show" do

    before(:each) do
      @product = Factory(:product)
    end

    it "should not be successfull not signed in visitor" do
      get :show, :id => @product.id
      response.should redirect_to(new_user_session_path)
    end

    it "should not be successfull signed in user" do
      get :show, :id => @product.id
      response.should redirect_to(new_user_session_path)
    end

    it "should be successfull for admin" do
      sign_in(Factory(:admin))
      get :show, :id => @product.id
      response.should be_success
    end
  end

  context "#new" do
    it "should not be successfull not signed in visitor" do
      get :new
      response.should redirect_to(new_user_session_path)
    end

    it "should not be successfull signed in user" do
      sign_in(Factory(:user))
      get :new
      response.should redirect_to(root_path)
    end

    it "should be successfull for admin" do
      sign_in(Factory(:admin))
      get :new
      response.should be_success
    end
  end

  context "#create" do
    it "should not be successfull not signed in visitor" do
      post :create, :product => Factory.attributes_for(:product)
      response.should redirect_to(new_user_session_path)
    end

    it "should not be successfull signed in user" do
      sign_in(Factory(:user))
      post :create, :product => Factory.attributes_for(:product)
      response.should redirect_to(root_path)
    end

    it "should be successfull for admin" do
      sign_in(Factory(:admin))
      lambda {
        post :create, :product => Factory.attributes_for(:product)
      }.should change(Product, :count).by(1)
    end
  end

  context "#update" do

    before(:each) do
      @product = Factory(:product)
      @new_product_attributes = Factory.attributes_for(:product).merge(:name => "Updated Product", :price => 45.79)
    end

    it "should not be successfull not signed in visitor" do
      put :update, :product => @new_product_attributes, :id => @product.to_param
      response.should redirect_to(new_user_session_path)
    end

    it "should not be successfull signed in user" do
      sign_in(Factory(:user))
      put :update, :product => @new_product_attributes, :id => @product.to_param
      response.should redirect_to(root_path)
    end

    it "should be successfull for admin" do
      sign_in(Factory(:admin))
      put :update, :product => @new_product_attributes, :id => @product.to_param
      assigns[:product].reload.name.should == "Updated Product"
      assigns[:product].price.should == 45.79
      response.should redirect_to(edit_product_path(:id => @product.to_param))
    end
  end
end
