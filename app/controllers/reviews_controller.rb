class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy]
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
    @review.title = ActionView::Base.full_sanitizer.sanitize(@review.title).strip
    @review.title = @review.title[0, @review.title.length - 1]
    if @review.save
      redirect_to reviews_path
    else
      # redirect_to new_user_session_path
      render 'reviews/new'
    end
  end

  def my_review
    @reviews = current_user.reviews.paginate(page: params[:page])
  end

  private

  def review_params
    params.require(:review).permit(:title, :content, :hotel_id, :image, :rate_avg)

  end
end
