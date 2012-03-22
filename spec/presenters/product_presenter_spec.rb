require 'spec_helper'

describe ProductPresenter do
  
  before :each do
    @product = Factory(:product)
    @presenter = ProductPresenter.new(@product, view)
  end
  
  it 'should delegate name, description and another fields of product' do
    @presenter.name.should == @product.name
    @presenter.description.should == @product.description
    @presenter.price.should == @product.price
  end
  
  it 'should price show in a currency string' do
    @presenter.currency_price.should == view.number_to_currency(@product.price)
  end
  
  it 'should show valid thumbnail without image' do
    @presenter.thumbnail.should include('placehold')
  end
  
  it 'should show valid thumbnail with image' do
    image = "image1.jpeg"
    @product = Factory(:product, :image => File.open(File.join(Rails.root, "spec", "factories", "files", image)))
    @presenter = ProductPresenter.new(@product, view)
    @presenter.thumbnail.should include("thumb_#{image}")
  end
  
  it 'should show valid thumbnail with image in link' do
    image = "image1.jpeg"
    @product = Factory(:product, :image => File.open(File.join(Rails.root, "spec", "factories", "files", image)))
    @presenter = ProductPresenter.new(@product, view)
    @presenter.thumbnail_with_link.should include("thumb_#{image}")
    @presenter.thumbnail_with_link.should include(image)
  end
  
end