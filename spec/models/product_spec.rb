require 'spec_helper'

describe Product do

  before :each do
    @attr = { 
      :title => "Title", 
      :description => "Description",
      :price => 10.50
    }
  end

  it "should create a new instance with valid attributes" do
    Product.create! @attr
  end

  it "should create a new instance given a factory girl produced product" do
    product = Factory :product
    product.save
  end

  describe "Validations" do
    it "should require a title" do
      product = Product.new @attr.merge(:title => "")
      product.should_not be_valid
    end

    it "should not allow duplicate titles" do
      Product.create! @attr
      product = Product.new @attr
      product.should_not be_valid
    end

    it "should require a description" do
      product = Product.new @attr.merge(:description => "")
      product.should_not be_valid
    end

    it "should require a positive price" do
      product = Product.new @attr.merge(:price => 0.001)
      product.should_not be_valid
    end  
  end
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

