class ShoppingCartsController < ApplicationController

  def destroy
    @item_cart = ShoppingCart.find_by(product_id: params[:id])
    @shopping_cart = ShoppingCart.all.includes(:product)
    @product = Product.find(@item_cart.product_id)
    if @item_cart.destroy
      respond_to do |format|
        format.turbo_stream do
        render turbo_stream:
        [
          turbo_stream.replace("cart_#{@item_cart.product_id}",
            partial: 'shared/add_cart',
            locals: {product_cart: @product}),
          turbo_stream.replace("shopping_cart_total_price",
            partial: 'shared/shopping_cart/shopping_total_price',
            locals: {shopping_cart: @shopping_cart}),
          turbo_stream.replace("shopping_cart_items",
            partial: 'shared/shopping_cart/shopping_cart_items',
            locals: {shopping_cart: @shopping_cart}),
        ]
        end
      end
    end
  end

  def create
    @item_cart = ShoppingCart.new(shopping_cart_params)
    @shopping_cart = ShoppingCart.all.includes(:product)
    @product = Product.find(@item_cart.product_id)
    if @item_cart.save
      respond_to do |format|
        format.turbo_stream do
         render turbo_stream:
         [
          turbo_stream.replace("cart_#{@item_cart.product_id}",
            partial: 'shared/add_cart',
            locals: {product_cart: @product}),
          turbo_stream.replace("shopping_cart_total_price",
            partial: 'shared/shopping_cart/shopping_total_price',
            locals: {shopping_cart: @shopping_cart}),
          turbo_stream.replace("shopping_cart_items",
            partial: 'shared/shopping_cart/shopping_cart_items',
            locals: {shopping_cart: @shopping_cart}),
         ]
        end
      end
    end
  end

  def update
    @shopping_cart = ShoppingCart.find_by(product_id: params[:product_id])
    @shopping_carts= ShoppingCart.all.includes(:product)
    case params[:change_quantity]
    when "-"
      @shopping_cart.quantity -= 1
    when "+"
      @shopping_cart.quantity += 1
    end
    if @shopping_cart.update(quantity: @shopping_cart.quantity)
      respond_to do |format|
        format.turbo_stream do
        render turbo_stream:
        [
          turbo_stream.replace("shopping_cart_total_price",
            partial: 'shared/shopping_cart/shopping_total_price',
            locals: {shopping_cart: @shopping_carts}),
          turbo_stream.replace("shopping_cart_items",
            partial: 'shared/shopping_cart/shopping_cart_items',
            locals: {shopping_cart: @shopping_carts}),
        ]
        end
      end
    end
  end

  private
  def shopping_cart_params
    params.require(:item_cart).permit(:quantity, :product_id)
  end
end
