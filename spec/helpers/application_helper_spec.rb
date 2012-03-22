require 'spec_helper'

describe ApplicationHelper do
  describe "present" do
    it "should create present from product" do
      presenter = helper.present(Factory(:product))
      presenter.should be_a(ProductPresenter)
    end
  end
end