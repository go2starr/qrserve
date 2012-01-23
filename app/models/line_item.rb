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
