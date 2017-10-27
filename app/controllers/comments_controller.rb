class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def index
    @comments = Comment.all
  end

  def create
    @comment = Comment.new(comment_params)
    @review = Review.find_by(id: params[:comment][:review_id])
    respond_to do |format|
      if @comment.save
        redirect_to @review
        # format.html {redirect_to @review}
        format.js
      else
        format.html {render 'new'}
        format.js
      end
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:user_id, :review_id, :content)
  end
end
