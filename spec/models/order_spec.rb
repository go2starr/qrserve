require 'spec_helper'



describe Order do
  
  describe "cart" do
    it "should require a cart" do
      @order = Order.new
      @order.should_not be_valid
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

