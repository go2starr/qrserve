class Product < ActiveRecord::Base

  # Relational
  has_many :line_items

  # Validations
  validates(:title, 
            :presence => true,
            :uniqueness => true)
  validates(:description, 
            :presence => true)
  validates(:price,
            :numericality => { :greater_than_or_equal_to => 0.01 })              
  
  # Default ordering
  default_scope :order => 'title'
            
  
end

# == Schema Information
#
# Table name: products
#
#  id          :integer         not null, primary key
#  title       :string(255)
#  description :text
#  price       :decimal(8, 2)
#  created_at  :datetime
#  updated_at  :datetime
#

