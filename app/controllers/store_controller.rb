class StoreController < ApplicationController
  include SessionsHelper
  include QrHelper

  # GET /
  def index
    if signed_in?
      @cart = current_user.cart
      @products = Product.all
      @qr = qrcode(cart_url @cart)
      
    else
      redirect_to signin_path
    end
  end
end
