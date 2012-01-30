class LineItemsController < ApplicationController

  include SessionsHelper

  # POST /line_items
  # POST /line_items.xml
  def create
    @cart = current_cart
    product = Product.find(params[:product_id])
    @line_item = @cart.line_items.build :product => product

    if @line_item.save!
      flash[:success] = "Product added to cart"
      redirect_to new_cart_path
    else
      render :action => "new"
    end
  end
  
  # DELETE /line_items/1
  # DELETE /line_items/1.xml
  def destroy
    @line_item = LineItem.find(params[:id])
    @line_item.destroy
    redirect_to(line_items_url)
  end
end
