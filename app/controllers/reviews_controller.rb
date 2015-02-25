class ReviewsController < ApplicationController
  before_filter :load_product
  before_filter :ensure_logged_in, only: [:create, :destroy]
  def show
    @review = Review.find(params[:id])
  end

  def create
    @review = @product.reviews.build(review_params)
    @review.user = current_user

    # Check out this article on [.build](http://stackoverflow.com/questions/783584/ruby-on-rails-how-do-i-use-the-active-record-build-method-in-a-belongs-to-rel)
    # You could use a longer alternate syntax if it makes more sense to you
    # 
    # @review = Review.new(
    #   comment: params[:review][:comment],
    #   product_id: @product.id,
    #   user_id: current_user.id
    # )
     respond_to do |format|
        if @review.save
          format.html {redirect_to product_path(@product), notice: 'Review created successfully'}
          format.js {}
        else
          format.html{ render 'products/show', alert: 'Error.  Failed to create Review'}
          format.js {}
        end
     end

  end

  def edit
    @review = Review.find(params[:id])
    load_product
  end

  def update
    @review = Review.find(params[:id])

    if @review.update_attributes(review_params)
      redirect_to @product
    else
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to @product
  end

  private
  def review_params
    params.require(:review).permit(:comment, :product_id)
  end

  def load_product
    @product = Product.find(params[:product_id])
  end
end