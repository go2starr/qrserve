require 'spec_helper'

describe Product do
  
  describe "validations" do
    before :each do
      @product = Product.new :title => "Test title", :description => "Test description"
    end
  end  
end
