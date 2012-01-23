require 'spec_helper'

describe ProductsController do

  before :each do
    @product = Factory :product
  end

  describe "GET index" do
    it "should be successful" do
      get :index
      response.should be_successful
    end

    it "should assign all products as @products" do
      get :index
      assigns(:products).should == Product.all
    end
  end

  describe "GET show" do
    it "should be successful" do
      get :show, :id => @product
      response.should be_successful
    end

    it "should assign the requested product as @product" do
      get :show, :id => @product
      assigns(:product).should == @product
    end
  end

  describe "GET new" do
    it "should be successful" do
      get :new
      response.should be_successful
    end

    it "assigns a new product as @product" do
      get :new
      assigns(:product).should_not be_nil
    end
  end

  describe "GET edit" do
    it "should be successful" do
      get :edit, :id => @product
      response.should be_successful
    end

    it "should assign product with the correct product" do
      get :edit, :id => @product
      assigns(:product).should == @product
    end
  end

  describe "POST create" do

    before :each do
      @attr = {
        :title => "Product title",
        :description => "Product description",
        :price => 10.50
      }
    end

    describe "success" do
      
      it "should create a product" do
        lambda do
          post :create, :product => @attr
        end.should change Product, :count
      end
        
      it "should redirect to the product show page" do
        post :create, :product => @attr
        response.should redirect_to product_path assigns :product
      end
    end

    describe "failure" do
      before :each do
        @attr[:title] = ""
      end
      
      it "should not create a product" do
        lambda do
          post :create, :product => @attr
        end.should_not change Product, :count
      end

      it "should render the 'new' page" do
        post :create, :user => @attr
        response.should render_template 'new'
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      xit "should update the product" do
      end
    end
    
    describe "with invalid params" do
      xit "should not change the product"
    end
  end

  describe "DELETE destroy" do
    it "should delete the product" do
      lambda do
        delete :destroy, :id => @product.id
      end.should change Product, :count
    end

    it "redirects to the products list" do
      delete :destroy, :id => @product.id
      response.should redirect_to products_url
    end
  end
end
