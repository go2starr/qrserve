
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
