class LikesController < ApplicationController
  def new
    @like = Like.new
  end

  def index

  end

  def create
    @like = Like.new(like_params)
    if @like.save
      redirect_to @like.review
    else
      render 'new'
    end
  end

  def destroy
    @like = Like.find_by(id: params[:like][:like_id])
    @review = @like.review
    Like.delete(@like.id)
    redirect_to @review
  end

  private
  def like_params
    params.require(:like).permit(:user_id, :review_id)
  end
end
