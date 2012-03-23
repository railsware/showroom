class ProductsController < ApplicationController
  before_filter :is_user_admin?
  before_filter :find_product, :only => [:show, :edit, :update, :destroy]

  def index
    page = params[:page] || 1
    @products = Product.ordered.page page
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(params[:product])
    if @product.save
      redirect_to product_path(@product)
    else
      render action: :new
    end
  end

  def update
    if @product.update_attributes(params[:product])
      redirect_to product_path(@product)
    else
      render action: :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end

  private

  def find_product
    @product = Product.find params[:id]
  end

end
