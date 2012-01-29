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
      respond_to do |format|
        format.html { redirect_to signin_path }
        format.mobile
      end
    end
  end
end
