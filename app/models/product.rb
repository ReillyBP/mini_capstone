class Product < ApplicationRecord
  belongs_to :supplier
  has_many :images
  def sale_message
    if price.to_f < 2
      "Discount item!"
    else
      "Every day value!"
    end
    def tax
      price.to_f * 0.09
    end
    def total
      tax + price.to_f
    end
  end
end


#Product.first.sale_message