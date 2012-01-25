# User model

Factory.define :user do |user|
  @first = Faker::Name::first_name
  @last = Faker::Name::last_name 
  @name = "#{@first}_#{@last}"
  user.name     "#{@name}"
  user.email    "#{@name}@factory.com" 
  user.password "password"
  user.password_confirmation "password"
end


# Product model

Factory.sequence :price do |n|
  Random.rand(50)
end

Factory.define :product do |product|
  product.title         { Faker::Name.first_name }
  product.description   "Description of product"
  product.price         Factory.next :price
end

# Cart model
Factory.define :cart do |cart|
  cart.user             Factory :user
end
