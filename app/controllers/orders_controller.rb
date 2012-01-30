class OrdersController < ApplicationController

  include SessionsHelper

  # GET /orders
  # GET /orders.xml
  def index
    @title = "Orders"
    @orders = Order.all

    if params[:user_id]
      @user = User.find params[:user_id]
      if @user
        @orders = @user.orders
      end
    end
  end

  # GET /orders/1
  # GET /orders/1.xml
  def show
    @order = Order.find(params[:id])
  end

  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
  end

  # POST /orders
  # POST /orders.xml
  def create
    @order = Order.new(params[:order])

    if @order.save
      
      # Assign a new cart to the creator
      @cart = Cart.create!
      @owner = @order.cart.user
      @owner.cart = @cart

      redirect_to @order.user
    else
      render :action => "new"
    end
  end

  # PUT /orders/1
  # PUT /orders/1.xml
  def update
    @order = Order.find(params[:id])

    if @order.update_attributes(params[:order])
      redirect_to(@order, :notice => 'Order was successfully updated.') 
    else
      render :action => "edit"
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.xml
  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    redirect_to(orders_url)
  end
end
