class LikesController < ApplicationController
  def new
    @like = Like.new
  end

  def info
    count = Like.where(review_id: params[:review_id]).count
    @like = Like.find_by(user_id: params[:user_id], review_id: params[:review_id])
    if @like.blank?
      status = 0
      result = {:count => count, :status => status}
    else
      status = 1
      result = {:count => count, :status => status, :id => @like.id}
    end

    respond_to do |format|
      format.json {render :json => result}
    end
  end

  def create
    @like = Like.new(like_params)
    if @like.save
      respond_to do |format|
        format.json {render :json => {:id => @like.id}}
      end
    else
      respond_to do |format|
        format.json {render :json => {:error => 'error'}}
      end
    end
  end

  def destroy
    @like = Like.find_by(id: params[:id])
    @review = @like.review
    Like.delete(@like.id)

    respond_to do |format|
      format.json {render :json => {:status => 'success'}}
    end
  end

  private
  def like_params
    params.require(:like).permit(:user_id, :review_id)
  end
end
