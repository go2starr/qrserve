class StoreController < ApplicationController
  include SessionsHelper

  # GET /
  def index
    if signed_in?
      @cart = current_user.cart
      @products = Product.all
    else
      redirect_to signin_path
    end
  end
end
