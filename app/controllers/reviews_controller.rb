class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy, :edit]
  def index
    # if user_signed_in?
    #   @reviews = current_user.reviews.paginate(page: params[:page])
    # else
    @reviews = Review.all.paginate(page: params[:page])
    # end
  end

  def show
    @review = Review.find(params[:id])
  end

  def new
    @review = Review.new
  end

  def create
    @review = current_user.reviews.build(review_params)
    if @review.save
      redirect_to @review
    else
      # redirect_to new_user_session_path
      render 'reviews/new'
    end
  end

  def update
    @review = Review.find(params[:id])
    if @review.update_attributes(review_params)
      redirect_to @review
    else
      render 'reviews/edit'
    end
  end

  def my_review
    @reviews = current_user.reviews.paginate(page: params[:page])
  end

  def edit
    @review = Review.find(params[:id])
  end

  private

  def review_params
    params.require(:review).permit(:title, :content, :hotel_id, :image, :rate_avg)

  end
end
