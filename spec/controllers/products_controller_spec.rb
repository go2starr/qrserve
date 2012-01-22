require 'spec_helper'

describe ProductsController do

  before :each do
    @product = Factory :product

    @attr = {
      :title => @product.title,
      :description => @product.description,
      :price => @product.price
    }
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

    describe "with valid params" do
      xit "assigns a newly created product as @product" do
        post :create, :product => @attr
        assigns(:product).should equal(@product)
      end

      xit "redirects to the created product" do
        post :create, :product => @attr
        
      end
    end
  end

  # describe "POST create" do

  #   describe "with valid params" do
  #     it "assigns a newly created product as @product" do
  #       Product.stub(:new).with({'these' => 'params'}) { mock_product(:save => true) }
  #       post :create, :product => {'these' => 'params'}
  #       assigns(:product).should be(mock_product)
  #     end

  #     it "redirects to the created product" do
  #       Product.stub(:new) { mock_product(:save => true) }
  #       post :create, :product => {}
  #       response.should redirect_to(product_url(mock_product))
  #     end
  #   end

  #   describe "with invalid params" do
  #     it "assigns a newly created but unsaved product as @product" do
  #       Product.stub(:new).with({'these' => 'params'}) { mock_product(:save => false) }
  #       post :create, :product => {'these' => 'params'}
  #       assigns(:product).should be(mock_product)
  #     end

  #     it "re-renders the 'new' template" do
  #       Product.stub(:new) { mock_product(:save => false) }
  #       post :create, :product => {}
  #       response.should render_template("new")
  #     end
  #   end

  # end

  # describe "PUT update" do

  #   describe "with valid params" do
  #     it "updates the requested product" do
  #       Product.should_receive(:find).with("37") { mock_product }
  #       mock_product.should_receive(:update_attributes).with({'these' => 'params'})
  #       put :update, :id => "37", :product => {'these' => 'params'}
  #     end

  #     it "assigns the requested product as @product" do
  #       Product.stub(:find) { mock_product(:update_attributes => true) }
  #       put :update, :id => "1"
  #       assigns(:product).should be(mock_product)
  #     end

  #     it "redirects to the product" do
  #       Product.stub(:find) { mock_product(:update_attributes => true) }
  #       put :update, :id => "1"
  #       response.should redirect_to(product_url(mock_product))
  #     end
  #   end

  #   describe "with invalid params" do
  #     it "assigns the product as @product" do
  #       Product.stub(:find) { mock_product(:update_attributes => false) }
  #       put :update, :id => "1"
  #       assigns(:product).should be(mock_product)
  #     end

  #     it "re-renders the 'edit' template" do
  #       Product.stub(:find) { mock_product(:update_attributes => false) }
  #       put :update, :id => "1"
  #       response.should render_template("edit")
  #     end
  #   end

  # end

  # describe "DELETE destroy" do
  #   it "destroys the requested product" do
  #     Product.should_receive(:find).with("37") { mock_product }
  #     mock_product.should_receive(:destroy)
  #     delete :destroy, :id => "37"
  #   end

  #   it "redirects to the products list" do
  #     Product.stub(:find) { mock_product }
  #     delete :destroy, :id => "1"
  #     response.should redirect_to(products_url)
  #   end
  # end

end
