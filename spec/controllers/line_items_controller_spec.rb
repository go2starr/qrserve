require 'spec_helper'

describe LineItemsController do

  before :each do
    @product = Factory :product
    @attr = {
      :product_id => @product
    }
  end
  
  describe "POST create" do
    before :each do
      test_sign_in Factory :user
    end

    it "should create a lineitem" do
      lambda do
        post :create, @attr
      end.should change LineItem, :count
    end

    it "should assign @cart the users cart" do
      post :create, @attr
      assigns(:cart).should == controller.current_user.cart
    end

    it "should assign the cart to the line item" do
      post :create, @attr
      assigns(:line_item).cart.should == assigns(:cart)
    end

    it "should assign the product to the line item" do
      post :create, @attr
      assigns(:line_item).product == @product
    end

     it "should redirect to the catalog" do
       post :create, @attr
       response.should redirect_to root_path
     end
  end
  
  describe "DELETE destroy" do
    before :each do
      @line_item = LineItem.new :cart => Cart.new, :product => @product
      @line_item.save!
    end
    
    it "should delete the lineitem" do
      lambda do
        delete :destroy, :id => @line_item
      end.should change LineItem, :count
    end
  end
end
