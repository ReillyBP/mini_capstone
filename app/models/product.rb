class Product < ApplicationRecord
  belongs_to :supplier
  has_many :images
  has_many :orders, through: :carted_products
  has_many :category_products
  has_many :categories, through: :category_products
  has_many :carted_products
  validates :name, :description, :price, presence: true


  def sale_message
    if price.to_f < 2
      "Discount item!"
    else
      "Every day value!"
    end
  end
  def tax
    price.to_f * 0.09
  end
  def total
    tax + price.to_f
  end
end


#Product.first.sale_message