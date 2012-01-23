require 'spec_helper'

describe LineItem do
  
  before :each do
    @product   = Factory :product
    @cart      = Cart.create!
    @line_item = @cart.line_items.build :product => @product
  end

  describe "validations" do
    it "should not be valid without a cart" do
      @line_item.cart = nil
      @line_item.should_not be_valid
    end

    it "should not be valid without a product" do
      @line_item.product = nil
      @line_item.should_not be_valid
    end
  end

  describe "associations" do

    before :each do
      @line_item.save
    end

    it "should belong to a product" do
      @line_item.should respond_to :product
    end
    
    it "should belong to a cart" do
      @line_item.should respond_to :cart
    end
    
    it "should get the right product" do
      @line_item.product.should == @product
    end
    
    it "should get the right cart" do
      @line_item.cart.should == @cart
    end

    xit "should be destroyed if its cart is destroyed" do
      lambda do
        @cart.delete
      end.should change LineItem, :count
    end
  end
end
