class Order < ApplicationRecord
  belongs_to :user
  has_many :carted_products
  has_many :products, through: :carted_products

def calculate_subtotal(carted_products)
  subtotal = 0
  carted_products.each do |carted_product|
    subtotal += (carted_product.product.price * carted_product.quantity)
  end
end
  self.subtotal = new_subtotal
  def calculate_tax
    self.tax = subtotal * 0.09
  end
end
