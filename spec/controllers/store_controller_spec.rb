require 'spec_helper'

describe StoreController do

  describe "GET root" do

    describe "when signed in" do
      before :each do
        @user = Factory :user
        test_sign_in @user
      end

      it "should be successful" do
        get :root
        response.should be_successful
      end
      
      it "should assign all products to @products" do
        10.times { Factory :product }
        get :root
        assigns(:products).should == Product.all
      end
      
      it "should assign the user's current cart" do
        get :root
        assigns(:cart).should == @user.cart
      end
    end

    describe "when not signed in" do
      it "should redirect to the signin page" do
        get :root
        response.should redirect_to signin_path
      end
    end
  end
end
