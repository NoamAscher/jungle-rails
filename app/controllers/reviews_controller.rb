class ReviewsController < ApplicationController
  before_filter :authorize
  def create
    @product = Product.find(params[:product_id])
    @review =  @product.reviews.new(review_params)
    @review.user = User.find(session[:user_id])
    # if @review.description != ""
    #   @review.save
    # end
    @review.save
    redirect_to @product #if @review.save <- this isn't actually needed and threw
                                           # the template missing error, now fixed.
  end

  def destroy
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to @product
  end

  private

  def review_params
    params.require(:review).permit(:rating, :description)
  end

end
