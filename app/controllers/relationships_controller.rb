class RelationshipsController < ApplicationController
  before_action :user_signed_in?
  def create
    @user = User.find(params[:followed_id])
    current_user.follow(@user)
    redirect_to user_profile_path(@user.id)
    respond_to do |format|
      # format.html { redirect_to user_profile_path(@user.id) }
      format.js
    end
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow(@user)
    redirect_to user_profile_path(@user.id)
    respond_to do |format|
      # format.html { redirect_to user_profile_path(@user.id) }
      format.js
    end
  end
end
