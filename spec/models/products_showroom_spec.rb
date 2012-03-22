require 'spec_helper'

describe ProductsShowroom do
  describe "validates" do
    it { should validate_presence_of :product_id }
    it { should validate_presence_of :showroom_id }
  end
end
