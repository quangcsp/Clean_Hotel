class RepliesController < ApplicationController
  def new
    @reply = Reply.new
  end

  def index
    @replies = Reply.all
  end

  def create
    @reply = Reply.new(reply_params)

    respond_to do |format|
      if @reply.save
        @review = @reply.comment.review
        redirect_to @review
        # format.html {redirect_to @review}
        format.js {}
      else
        format.html {render 'new'}
        format.js {}
      end
    end
  end

  private
  def reply_params
    params.require(:reply).permit(:user_id, :comment_id, :content)
  end
end
