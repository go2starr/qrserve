require 'rqrcode'

module QrHelper
  def qrcode(string)
    @qr = RQRCode::QRCode.new(string)
  end
end
