class ProductsController < ApplicationController

  def index
    @products = Product.all
    @shopping_cart = ShoppingCart.all.includes(:product)
  end
end
