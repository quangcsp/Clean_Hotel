class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_param)
    review = Review.find_by(id: params[:bookmark][:review_id])
    if @bookmark.save
      redirect_to review
    else
      render 'new'
    end
  end

  def destroy
    @bookmark = Bookmark.find_by(id: params[:bookmark][:bookmark_id])
    review = @bookmark.review
    Bookmark.delete(@bookmark.id)
    redirect_to review
  end

  def bookmark_param
    params.require(:bookmark).permit(:user_id, :review_id)
  end
end
