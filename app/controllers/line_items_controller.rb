class LineItemsController < ApplicationController

  include SessionsHelper

  # GET /line_items
  # GET /line_items.xml
  def index
    @line_items = LineItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @line_items }
    end
  end

  # GET /line_items/1
  # GET /line_items/1.xml
  def show
    @line_item = LineItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @line_item }
    end
  end

  # GET /line_items/1/edit
  def edit
    @line_item = LineItem.find(params[:id])
  end

  # POST /line_items
  # POST /line_items.xml
  def create
    @cart = current_user.cart
    product = Product.find(params[:product_id])
    @line_item = @cart.line_items.build :product => product

    respond_to do |format|
      if @line_item.save!
        format.html { 
          flash[:success] = "Product added to cart"
          redirect_to(root_path)
        }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # DELETE /line_items/1
  # DELETE /line_items/1.xml
  def destroy
    @line_item = LineItem.find(params[:id])
    @line_item.destroy

    respond_to do |format|
      format.html { redirect_to(line_items_url) }
      format.xml  { head :ok }
    end
  end
end
