require 'spec_helper'

describe ApplicationHelper do
  describe "present" do
    it "should create present from product" do
      presenter = helper.present(Factory(:product))
      presenter.should be_a(ProductPresenter)
    end
  end
  
  describe "menu_tab" do
    it "should create li with link" do
      title = "Products"
      menu = helper.menu_tab(title, products_path)
      menu.should == "<li><a href=\"#{products_path}\">#{title}</a></li>"
    end
  end
end