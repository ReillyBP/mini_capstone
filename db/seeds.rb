# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Product.update_all(in_stock: true)
Product.all.each do |product|
  Product.update(supplier_id: Supplier.first.id)
end
Product.all.each do |product|
  Image.create(url: "https://www.theteamakers.co.uk/user/products/large/Eary%20Grey%203.jpg", product_id: product.id)
end