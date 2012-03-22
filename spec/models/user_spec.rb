require 'spec_helper'

describe User do
  subject do
    10.times { Factory(:product) }
    Factory(:user)
  end

  it "showroom should be nil" do
    subject.showrooms.first.should_not be_nil
  end

  it "showroom.products.count should == 10" do
    subject.showrooms.first.products.count.should == 10
  end
end
