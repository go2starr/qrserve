require 'spec_helper'

describe Order do
  
  describe "cart" do
    before :each do
      @cart = Factory :cart
      @attr = {
        :cart_id => @cart
      }
    end

    it "should be required" do
      @order = Order.new @attr.merge :cart_id => nil
      @order.should_not be_valid
    end

    it "should be unique" do
      @order = Order.create! @attr
      @dup = Order.new @attr
      @dup.should_not be_valid
    end
  end

  describe "complete? method" do
    it "should be true if the order has a user" do
      @order = Order.new(:user => (Factory :user))
      @order.complete?.should be_true
    end
  end
  
end

# == Schema Information
#
# Table name: orders
#
#  id         :integer         not null, primary key
#  cart_id    :integer
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

