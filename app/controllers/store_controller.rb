class StoreController < ApplicationController
  include SessionsHelper

  # GET /
  def index
    @cart = current_cart
    @products = Product.all
  end

end
