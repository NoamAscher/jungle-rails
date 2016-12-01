class Admin::CategoriesController < ApplicationController
  http_basic_authenticate_with :name => ENV['ADMIN_USER'], :password => ENV['ADMIN_PASSWORD']

  def index
    @category = Category.order(name: :desc).all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
     # redirect_to [:admin, :category], notice: 'Category created!'
     redirect_to admin_categories_path, notice: 'Category created!'
    else
      render :new
    end
  end

  def destroy
    @category = Category.find params[:id]
    if Product.exists?(category_id=@category)
      redirect_to admin_categories_path, notice: 'Cannot delete, category still has prodcuts.'
    else
      @category.destroy
      redirect_to admin_categories_path, notice: 'Category deleted!'
    end
  end

  def category_params
    params.require(:category).permit(
      :name,
      :created_at,
      :updated_at
    )
  end

end
