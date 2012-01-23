require 'spec_helper'

describe StoreController do

  describe "GET index" do
    it "should be successful" do
      get :index
      response.should be_successful
    end

    it "should assign all products to @products" do
      10.times { Factory :product, :title => (Factory.next :title) }
      get :index
      assigns(:products).should == Product.all
    end

    it "should assign the current cart" do
      get :index
      assigns(:cart).class.should be Cart
    end
  end
end
