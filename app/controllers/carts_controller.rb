class CartsController < ApplicationController
  include SessionsHelper
  protect_from_forgery

  def show
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
