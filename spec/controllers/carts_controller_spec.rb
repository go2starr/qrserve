require 'spec_helper'

describe CartsController do
  render_views

  # aka Orders.new "
  describe "GET 'show'" do
    before :each do
      @user = Factory :user
      @cart = Factory :cart
    end

    describe "for non signed-in users" do
      it "should redirect to signin page" do
        get :show, :id => @cart
        response.should redirect_to signin_path
      end
    end

    describe "for signed-in users" do
      before :each do
        test_sign_in @user
      end

      it "should have the right title" do
        get :show, :id => @cart
        assigns(:title).should =~ /cart/i
      end
      
      it "should be successful" do
        get :show, :id => @cart
        response.should be_successful
      end

      it "should assign @cart" do
        get :show, :id => @cart
        assigns(:cart).should_not be_nil
      end

      it "should assign @user" do
        get :show, :id => @cart
        assigns(:user).should_not be_nil
      end

      it "should display the @cart total" do
        get :show, :id => @cart
        response.should have_selector("h2", :content => @cart.total.to_s)
      end
    end
  end
end
