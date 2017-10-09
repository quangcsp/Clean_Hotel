class ReviewsController < ApplicationController
  def index
    if user_signed_in?
      @reviews = current_user.reviews
    else
      @reviews = Review.all
    end
  end

  def show
    @review = Review.find(params[:id])
  end

  def new
    @review = Review.new
  end

  def create
    # @review = current_user.reviews.build review_params
    # # Neu ko co params book_id thi tao sach moi bang book_title
    # if params[:book_id].present?
    #   @review.book_id = params[:book_id]
    # else
    #   @review.book = Book.find_or_create_by title: params[:book_title]
    # end
    # if @review.save
    #   redirect_to reviews_path(anchor: "review-layout-#{ @review.id }")
    # else
    #   flash[:error] = @review.errors.full_messages.to_sentence
    #   redirect_back fallback_location: new_review_path
    # end
    @review = current_user.reviews.build review_params
    if @review.save
      redirect_to root_path
    else
      redirect_to new_user_session_path
    end
  end

  private

  def review_params
    params.require(:review).permit(:title, :content, :hotel_id, :image, :rate_avg)

  end
end
