class Product < ApplicationRecord
  has_one :shopping_cart, dependent: :destroy
end
