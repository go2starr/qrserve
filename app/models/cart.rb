class Cart < ActiveRecord::Base
  has_many :line_items, :dependent => :destroy
  belongs_to :user
end

# == Schema Information
#
# Table name: carts
#
#  id         :integer         not null, primary key
#  created_at :datetime
#  updated_at :datetime
#

