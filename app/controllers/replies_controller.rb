class RepliesController < ApplicationController
  def new
    @reply = Reply.new
  end

  def index
    @replies = Reply.all
  end

  def create
    @reply = Reply.new(reply_params)

    if @reply.save
      owner = User.find(@reply.user_id)
      reply = {
          :id => @reply.id,
          :created_at => @reply.created_at,
          :content => @reply.content,
          :comment_id => @reply.comment_id,
          :owner => {
              :id => owner.id,
              :name => owner.name,
              :avatar => owner.avatar.url ? owner.avatar.url : '/no_avatar.jpg',
          },
      }
      respond_to do |format|
        format.json {render :json => reply}
        format.js
      end
    else
      respond_to do |format|
        format.json {render :json => {:error => 'has error'}}
        format.html {render 'new'}
        format.js
      end
    end
  end


  def destroy
    @reply = Reply.find(params[:id])
    comment_id = @reply.comment_id
    if current_user.id == @reply.user_id
      status = @reply.destroy
      respond_to do |format|
        format.json {render :json => {:status => status, :comment_id => comment_id}}
      end
    end
  end

  private
  def reply_params
    params.require(:reply).permit(:user_id, :comment_id, :content)
  end
end
