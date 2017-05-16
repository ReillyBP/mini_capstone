class ProductsController < ApplicationController
  def index
    @products = Product.all
    render "index.html.erb"
  end
  def product_form_method
    render "product_form.html.erb"
  end
  def create
    @product = Product.new(name: params[:name_param], price: params[:price_param], description: params[:description_param])
    @product.save
    flash[:success] = "Your tea has been successfully created!"
    redirect_to "/products/#{@product.id}"
  end
  def show
    @product = Product.find_by(id: params[:id])
    render "show.html.erb"
  end
  def new
    render "new.html.erb"
  end
  def edit
    @product = Product.find_by(id: params[:id])
    render "edit.html.erb"
  end
  def update
    @product = Product.find_by(id: params[:id])
    @product.update(name: params[:name_param], price: params[:price_param], description: params[:description_param])
    flash[:info] = "Your tea has been updated successfully"
    redirect_to "/products/#{@product.id}"
  end
  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
    flash[:danger] = "Your product has been deleted."
    redirect_to "/products"
  end
end
