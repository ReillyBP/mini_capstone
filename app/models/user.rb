class User < ApplicationRecord
  has_secure_password
  has_many :carted_products
  has_many :orders, through: :carted_products
  validates :name, presence: true, uniqueness: true

end
