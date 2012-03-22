require 'spec_helper'

describe Product do
  describe "validates" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :price }
  end
end
