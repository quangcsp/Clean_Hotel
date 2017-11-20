class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
  end

  def index
    bookmarks = Bookmark.where(user_id: current_user.id)

    @bookmarks = []

    bookmarks.each do |bookmark|
      @bookmarks.push(bookmark.review)
    end
  end

  def create
    @bookmark = Bookmark.new(bookmark_param)
    review = Review.find_by(id: params[:bookmark][:review_id])
    if @bookmark.save
      redirect_to :back
    else
      render 'new'
    end
  end

  def destroy
    @bookmark = Bookmark.find_by(id: params[:bookmark][:bookmark_id])
    review = @bookmark.review
    Bookmark.delete(@bookmark.id)
    redirect_to :back
  end

  def bookmark_param
    params.require(:bookmark).permit(:user_id, :review_id)
  end
end
