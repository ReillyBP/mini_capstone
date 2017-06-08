class CartedProductsController < ApplicationController
  def index
    if current_user
      @carted_products = current_user.carted_products.where(status: "carted")
    else
      redirect_to "/login"
    end
  end

  def create
    carted_product = CartedProduct.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      status: "carted"
    )
    if carted_product.save
      flash[:success] = "Your item has been successfully added to your cart!"
      redirect_to "/carted_products"
    else
      flash[:warning] = "Your item could not be added due to the following reasons:#{carted_product.errors.full_messages.join(",")}"
      redirect_to "/carted_products/#{params[:product_id]}"
    end
    def destroy
      carted_product = CartedProduct.find_by(id: params[:id])
      carted_product.update(status: "removed")
      redirect_to "/carted_product"
    end
  end
end