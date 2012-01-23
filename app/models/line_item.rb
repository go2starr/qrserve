class LineItem < ActiveRecord::Base

  # Relational
  belongs_to :cart
  belongs_to :product

  # Validations
  validates(:cart,
            :presence => true)
  validates(:product,
            :presence => true)
  
end

# == Schema Information
#
# Table name: line_items
#
#  id         :integer         not null, primary key
#  product_id :integer
#  cart_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

