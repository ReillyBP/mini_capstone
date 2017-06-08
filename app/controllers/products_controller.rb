class ProductsController < ApplicationController
  before_action :authenticate_admin!, except: [:index, :show]
  def index
    if params[:sort]
      @products = Product.order(params[:sort])
    elsif params[:category]
      category = Category.find_by(name: params[:category])
      @products = category.products
    else
      @products = Product.all
    end
    if session[:visit_count]
      session[:visit_count] +=1
    else
      session[:visit_count] = 1
    end
    @visit_count = session[:visit_count]
    render "index.html.erb"
  end
  def product_form_method
    render "product_form.html.erb"
  end
  def create
    @product = Product.new(name: params[:name_param], price: params[:price_param], description: params[:description_param], in_stock: params[:in_stock_param])
      if @product.save
      flash[:success] = "Your tea has been successfully created!"
      redirect_to "/products/#{@product.id}"
    else
      flash[:warning] = "Product not created for the following reasons: #{@product.full_messages.join(",")}"
      render "new.html.erb"
    end
  end
  def show
    @product = Product.find_by(id: params[:id])
    render "show.html.erb"
  end
  def new
    @product = Product.new
    render "new.html.erb"
  end
  def edit
      @product = Product.find_by(id: params[:id])
      render "edit.html.erb"
  end
  def update
      @product = Product.find_by(id: params[:id])
      @product.update(name: params[:name_param], price: params[:price_param], description: params[:description_param], in_stock: params[:in_stock_param])
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