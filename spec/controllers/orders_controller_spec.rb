require 'spec_helper'

describe OrdersController do
  render_views

  describe "POST 'create'" do
    before :each do
      @cart = Factory :cart
      @user = Factory :user
      @attr = {
        :cart_id => @cart,
        :user_id => @user
      }
    end

    it "should create the order" do
      lambda do
        post :create, :order => @attr
      end.should change Order, :count      
    end

    it "should assign a new cart to the carts user" do
      post :create, :order => @attr
      assigns(:owner).cart.should_not == @cart
    end

    it "should redirect to the users page" do
      post :create, :order => @attr
      response.should redirect_to @user
    end
  end
end
