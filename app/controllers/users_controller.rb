class UsersController < ApplicationController
  before_filter :is_user_admin?
  before_filter :find_user, :only => [:show, :edit, :update, :destroy]
  
  def index
    page = params[:page] || 1
    @users = User.ordered.page page
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user].except(:role))
    @user.role = params[:user][:role]
    if @user.save
      redirect_to user_path(@user)
    else
      render action: :new
    end
  end
  
  def update
    @user.email = params[:user][:email]
    @user.role = params[:user][:role]
    if params[:user][:password] && !params[:user][:password].blank?
      @user.password = params[:user][:password]
      @user.password_confirmation = params[:user][:password_confirmation]
    end
    if @user.save
      redirect_to edit_user_path(@user)
    else
      render action: :edit
    end
  end
  
  def destroy
    @user.destroy
    redirect_to users_path
  end
  
  private
  
  def find_user
    @user = User.find params[:id]
  end
  
end
