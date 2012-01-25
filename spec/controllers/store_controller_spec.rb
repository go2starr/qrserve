require 'spec_helper'

describe StoreController do

  describe "GET index" do

    describe "when signed in" do
      before :each do
        @user = Factory :user
        test_sign_in @user
      end

      it "should be successful" do
        get :index
        response.should be_successful
      end
      
      it "should assign all products to @products" do
        10.times { Factory :product }
        get :index
        assigns(:products).should == Product.all
      end
      
      it "should assign the user's current cart" do
        get :index
        assigns(:cart).should == @user.cart
      end
    end

    describe "when not signed in" do
      it "should redirect to the signin page" do
        get :index
        response.should redirect_to signin_path
      end
    end
  end
end
