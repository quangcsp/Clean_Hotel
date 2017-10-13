class HotelsController < ApplicationController
  def index
    @hotels = Hotel.all
    respond_to do |format|
      format.html
      format.json {render :json => @hotels}
    end
  end

  def show
    @hotel = Hotel.find_by(id: params[:id])
  end

  def new
    @hotel = Hotel.new
  end

  def create
    @hotel = Hotel.create(hotel_params)
    if @hotel.save
      # redirect ve trang show chi tiet khach san hotels/show
      redirect_to @hotel
    else
      render "hotels/new"
    end
  end

  private

  def hotel_params
    params.require(:hotel).permit(:name, :address, :phone, :description, :avatar, :star)
  end

end
