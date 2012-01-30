require 'spec_helper'

describe UsersController do
  render_views

  describe "GET 'new'" do
    it "should have the right title" do
      assigns(:title).should =~ /create an account/i
    end
    
    it "should be successful" do
      response.should be_success
    end
  end
  
  describe "POST 'create'" do
    describe "failure" do
      before :each do
        @attr = {
          :name => "",
          :email => "",
          :password => "",
          :password_confirmation => ""
        }
      end

      it "should not create a user" do
        lambda do
          post :create, :user => @attr
        end.should_not change User, :count
      end

      it "should render the 'new' page" do
        post :create, :user => @attr
        response.should render_template 'new'
      end
    end

    describe "success" do
      before :each do
        @attr = {
          :name => "Mike",
          :email => "user@example.com",
          :password => "password", 
          :password_confirmation => "password"
        }
      end

      it "should create a new user" do
        lambda do
          post :create, :user => @attr
        end.should change User, :count
      end

      it "should redirect to the user show page" do
        post :create, :user => @attr
        response.should redirect_to user_path assigns(:user)
      end

      it "should sign the user in" do
        post :create, :user => @attr
        controller.should be_signed_in
      end
    end
  end  
end
