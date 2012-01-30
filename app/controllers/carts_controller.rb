class CartsController < ApplicationController
  include QrHelper
  include SessionsHelper
  protect_from_forgery

  def new
    if signed_in?
      @cart = current_user.cart
      @products = Product.all
      @qr = qrcode(cart_url @cart)
    end
  end

  def show
    @title = "Create a Cart"
    @cart = Cart.find(params[:id])
    
    if signed_in?
      @user = current_user
    else
      redirect_to signin_path
      return
    end    
  end

private

end
