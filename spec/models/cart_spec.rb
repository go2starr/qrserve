require 'spec_helper'

describe Cart do
  before :each do
    @cart = Cart.create!
  end

  it "should have a line_items method" do
    @cart.should respond_to :line_items
  end

  describe "total method" do
    before :each do
      10.times do |n|
        @product = Factory :product
        @cart.line_items.build :product => @product
      end
    end
        
    it "should have a total method" do
      @cart.should respond_to :total
    end

    it "should produce the right total" do
      total = 0
      @cart.line_items.each do |li|
        total += li.product.price
      end
      @cart.total.should eq total
    end
  end
end


# == Schema Information
#
# Table name: carts
#
#  id         :integer         not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#

