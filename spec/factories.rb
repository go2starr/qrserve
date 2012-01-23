# User model
Factory.define :user do |user|
  user.name     "Mike Starr"
  user.email    "go2starr@gmail.com"
  user.password "password"
  user.password_confirmation "password"
end


# Product model
Factory.sequence :title do |n|
  "product-title-#{n}"
end

Factory.sequence :price do |n|
  Random.rand(50)
end

Factory.define :product do |product|
  product.title         Factory.next :title
  product.description   "Product description"
  product.price         Factory.next :price
end
