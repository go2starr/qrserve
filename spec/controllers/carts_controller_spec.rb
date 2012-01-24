require 'spec_helper'

describe CartsController do

  describe "GET 'show'" do
    before :each do
      @user = Factory :user
    end

    it "should be successful" do
      get :show, :id => @user.cart
      response.should be_successful
    end
  end
end
