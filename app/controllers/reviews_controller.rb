class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy, :edit]

  def index
    # if user_signed_in?
    #   @reviews = current_user.reviews.paginate(page: params[:page])
    # else
    @hotels = Hotel.where(status: 'accept')
    @reviews = Review.where(hotel_id: @hotels.each do |hotel| hotel.id end).order(created_at: :desc).paginate(page: params[:page])
    # end
  end

  def show
    @review = Review.find(params[:id])
    _comments = Comment.order(created_at: :asc).where(review_id: @review.id)
    comments = []
    _comments.each do |c|
      owner = User.find(c.user_id)

      _replies = Reply.where(comment_id: c.id)
      replies = []
      _replies.each do |r|
        rowner = User.find(r.user_id)
        rtmp = {
            :id => r.id,
            :created_at => r.created_at,
            :owner => {
                :id => rowner.id,
                :name => rowner.name,
                :avatar => rowner.avatar.url ? rowner.avatar.url : '/no_avatar.jpg',
            },
            :content => r.content
        }
        replies.push(rtmp)
      end

      tmp = {
          :id => c.id,
          :created_at => c.created_at,
          :owner => {
              :id => owner.id,
              :name => owner.name,
              :avatar => owner.avatar.url ? owner.avatar.url : '/no_avatar.jpg',
          },
          :content => c.content,
          :replies => replies
      }
      comments.push(tmp)
    end

    respond_to do |format|
      format.html
      format.json {render :json => comments}
    end
  end

  def new
    @review = Review.new
  end

  def create
    @review = current_user.reviews.build(review_params)
    if @review.save
      @users = current_user.followers
      @users.each do |user|
        Notification.create(subscriber_id: user.id, notifi_user_id: current_user.id, action: 'review', review_id: @reivew.id,  message: '')
      end
      redirect_to @review
    else
      render 'reviews/new'
    end
  end

  def update
    @review = Review.find(params[:id])
    if @review.update_attributes(review_params)
      redirect_to @review
    else
      render 'reviews/edit'
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def destroy
    @review = Review.find(params[:id]).destroy
    redirect_to reviews_path
  end

  def my_review
    @reviews = current_user.reviews.paginate(page: params[:page])
  end


  private

  def review_params
    params.require(:review).permit(:title, :content, :hotel_id, :image, :rate)
  end

end
