class OrdersController < ApplicationController
  def create
    carted_products = current_user.carted_products.where(status: "carted")
  
    order = Order.new(user_id: current_user.id)
    order.calculate_subtotal(carted_products)
    if order.save
      flash[:success] = "order created!"
      @carted_products.update_all(status: "purchased", order_id: order.id)
      redirect_to "/orders/#{@order.id}"
    else
      flash[:warning]
  end
def show
  @order = Order.find_by(id: params[:id])
  if current_user && @order.user == current_user
  render "show.html.erb" 
  end
end
end