class StoreController < ApplicationController

  # GET /
  def index
    @products = Product.all
  end

end
