class StoreController < ApplicationController

  # GET /
  def index
    @cart = current_cart
    @products = Product.all
  end

end
