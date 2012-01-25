class Order < ActiveRecord::Base
  
  # Relational
  belongs_to :user
  belongs_to :cart

  # Validations
  validates(:cart,
            :presence => true)
            

  def complete?
    !user.nil?
  end

end

# == Schema Information
#
# Table name: orders
#
#  id         :integer         not null, primary key
#  cart_id    :integer
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

