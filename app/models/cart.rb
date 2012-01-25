class Cart < ActiveRecord::Base
  has_many :line_items, :dependent => :destroy
  belongs_to :user
  has_one :order


  def total
    total = 0
    self.line_items.each do |li|
      total += li.product.price
    end
    total
  end
end


# == Schema Information
#
# Table name: carts
#
#  id         :integer         not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#

