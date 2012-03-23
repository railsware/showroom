require 'spec_helper'

describe UsersController do

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
      @user = Factory(:user)
    end

    it "should not be successfull not signed in visitor" do
      get :show, :id => @user.id
      response.should redirect_to(new_user_session_path)
    end

    it "should not be successfull signed in user" do
      get :show, :id => @user.id
      response.should redirect_to(new_user_session_path)
    end

    it "should be successfull for admin" do
      sign_in(Factory(:admin))
      get :show, :id => @user.id
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
      post :create, :user => Factory.attributes_for(:user).merge(role: "user")
      response.should redirect_to(new_user_session_path)
    end

    it "should not be successfull signed in user" do
      sign_in(Factory(:user))
      post :create, :user => Factory.attributes_for(:user).merge(role: "user")
      response.should redirect_to(root_path)
    end

    it "should be successfull for admin" do
      sign_in(Factory(:admin))
      lambda {
        post :create, :user => Factory.attributes_for(:user).merge(role: "user")
      }.should change(User, :count).by(1)
    end
    
    it "should not be successfull for admin and empty user email or password" do
      sign_in(Factory(:admin))
      lambda {
        post :create, :user => Factory.attributes_for(:user).merge({email: ""})
      }.should change(User, :count).by(0)
      response.should render_template('new')
      lambda {
        post :create, :user => Factory.attributes_for(:user).merge({password: ""})
      }.should change(User, :count).by(0)
      response.should render_template('new')
    end
  end

  context "#update" do

    before(:each) do
      @user = Factory(:user)
      @new_user_attributes = Factory.attributes_for(:user).merge(role: "admin")
    end

    it "should not be successfull not signed in visitor" do
      put :update, :user => @new_user_attributes, :id => @user.to_param
      response.should redirect_to(new_user_session_path)
    end

    it "should not be successfull signed in user" do
      sign_in(Factory(:user))
      put :update, :user => @new_user_attributes, :id => @user.to_param
      response.should redirect_to(root_path)
    end

    it "should be successfull for admin" do
      sign_in(Factory(:admin))
      put :update, :user => @new_user_attributes, :id => @user.to_param
      assigns[:user].reload.role.should == "admin"
      response.should redirect_to(edit_user_path(:id => @user.to_param))
    end
    
    it "should not be successfull for admin and empty email" do
      sign_in(Factory(:admin))
      put :update, :user => @new_user_attributes.merge(email: ""), :id => @user.to_param
      @user.email.should_not == @new_user_attributes["email"]
      response.should render_template('edit')
    end
  end
  
  context "#destroy" do

    before(:each) do
      @user = Factory(:user)
    end
    
    it "should not be successfull for not signed in visitor" do
      lambda {
        delete :destroy, :id => @user.to_param
      }.should change(User, :count).by(0)
      response.should redirect_to(new_user_session_path)
    end
    
    it "should not be successfull for signed in user" do
      sign_in(Factory(:user))
      lambda {
        delete :destroy, :id => @user.to_param
      }.should change(User, :count).by(0)
      response.should redirect_to(root_path)
    end
    
    it "should be successfull by admin" do
      sign_in(Factory(:admin))
      lambda {
        delete :destroy, :id => @user.to_param
      }.should change(User, :count).by(-1)
      response.should redirect_to(users_path)
    end
  end

end
