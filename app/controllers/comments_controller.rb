class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def index
    @comments = Comment.all
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      owner = User.find(@comment.user_id)
      comment = {
          :id => @comment.id,
          :created_at => @comment.created_at,
          :content => @comment.content,
          :owner => {
              :id => owner.id,
              :name => owner.name,
              :avatar => owner.avatar.url ? owner.avatar.url : '/no_avatar.jpg',
          },
          :reply => []
      }
      respond_to do |format|
        format.json {render :json => comment}
        format.js
      end
    else
      respond_to do |format|
        format.html {render 'new'}
        format.js
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if current_user.id == @comment.user_id
      status = @comment.destroy
      respond_to do |format|
        format.json {render :json => status}
      end
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:user_id, :review_id, :content)
  end
end
