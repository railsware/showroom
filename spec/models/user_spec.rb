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
  
  describe "abilities" do
    subject { ability }
    let(:ability){ Ability.new(user) }

    context "when is an admin" do
      let(:user){ Factory(:admin) }

      it{ should be_able_to(:manage, :all) }
    end
    
    context "when is an regular user" do
      let(:user){ Factory(:user) }
      
      it{ should_not be_able_to(:manage, :all) }
      it{ should be_able_to(:read, :all) }
    end
  end
  
end
