class Admin::CategoriesController < ApplicationController

  def index
    @category = Category.order(name: :desc).all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
     redirect_to [:admin, :categories], notice: 'Category created!'
     #redirect_to admin_categories_path
    else
      render :new
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
