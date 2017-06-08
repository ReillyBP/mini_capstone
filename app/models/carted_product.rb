class CartedProduct < ApplicationRecord
  belongs_to :order, optional: true
  belongs_to :user
  belongs_to :product
  validates :quantity, presence: true
  validates :quantity, numericality: true
end
