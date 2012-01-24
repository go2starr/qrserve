require 'rqrcode'

class CartsController < ApplicationController

  protect_from_forgery

  def show
    @cart = Cart.find(params[:id])
    @qr = qrcode (cart_url @cart)
  end


private

  def qrcode(string)
    @qr = RQRCode::QRCode.new(string)
  end

end
