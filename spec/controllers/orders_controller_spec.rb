require 'spec_helper'

describe OrdersController do
  render_views

  describe "GET index" do
    it "should have the right title" do
      get :index
      assigns(:title).should =~ /order/i
    end
  end

  describe "POST 'create'" do
    before :each do
      @user = Factory :user
      @cart = @user.cart.build
      
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
      response.should redirect_to user_orders_path(@user)
    end
  end
end
