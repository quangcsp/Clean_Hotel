class ProfilesController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
    @reviews = @user.reviews.paginate(page: params[:page])
  end
end
