require 'spec_helper'

describe Cart do
  before :each do
    @cart = Cart.create!
  end

  it "should have a line_items method" do
    @cart.should respond_to :line_items
  end
end
