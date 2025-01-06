class CartsController < ApplicationController
  before_action :authenticate_user_with_flash!

  def view
    cart = current_user.cart
    @cart_items = cart.cart_items.includes(:product)

    @cart_total = @cart_items.sum { |cart_item| cart_item.product.price }
    @orders = current_user.orders
  end

  def add
    @cart = current_user.cart
    product = Product.find(params[:product_id])

    if product.status == "available"
      @cart.cart_items.create(product_id: product.id)
      product.status = "in_cart"
      product.save
      redirect_to cart_path, notice: "Gem added to your cart."
    else
      redirect_to cart_path, notice: "Gem cannot be added to your cart."
    end
  end

  def remove
    cart = current_user.cart
    cart_item = cart.cart_items.find(params[:cart_item_id])


    if cart_item.product.status == "in_cart"
      cart_item.product.status = "available"
      cart_item.product.save
      cart_item.destroy
      redirect_to cart_path, notice: "Gem removed from your cart."
    else
      redirect_to cart_path, notice: "Gem could not be removed."
    end
  end

  private

  def authenticate_user_with_flash!
    unless user_signed_in?
      flash[:alert] = "You must log in to view your cart."
      redirect_to new_user_session_path
    end
  end

end
