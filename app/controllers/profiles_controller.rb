class ProfilesController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:avatar]
  def show
    @user = User.find_by(id: params[:id])
    @reviews = @user.reviews.paginate(page: params[:page])
  end

  def avatar
    @user = User.find_by(id: params[:id])
    @user.update_attributes(avatar: params[:profile][:avatar])
    respond_to do |format|
      format.html {redirect_to user_profile_path(@user.id)}
      format.js
    end
  end

  private
  def params_avatar
    params.require(:profile).permit(:avatar)
  end
end
