class Admin::ProductsController < ApplicationController
  http_basic_authenticate_with :name => ENV['ADMIN_USER'], :password => ENV['ADMIN_PASSWORD']

  def index
    @products = Product.order(id: :desc).all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to [:admin, :products], notice: 'Product created!'
    else
      render :new
    end
  end

  def destroy
    @product = Product.find params[:id]
    if LineItem.exists?(product_id=@product)
      redirect_to [:admin, :products], notice: 'Can\'t delete: product has been ordered, order not yet received.'
    else
      @product.destroy
      redirect_to [:admin, :products], notice: 'Product deleted!'
    end
  end

  private

  def product_params
    params.require(:product).permit(
      :name,
      :description,
      :category_id,
      :quantity,
      :image,
      :price
    )
  end

end
