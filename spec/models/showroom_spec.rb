require 'spec_helper'

describe Showroom do
  
  describe "outdated" do
    it "should be outdated by scope" do
      Showroom.outdated.count.should == 0
      Factory(:outdated_showroom)
      Showroom.outdated.count.should == 1
    end
  end
  
  describe "not outdated" do
    it "should be not outdated by scope" do
      Showroom.outdated.count.should == 0
      Factory(:not_outdated_showroom)
      Showroom.outdated.count.should == 0
    end
  end
  
end
