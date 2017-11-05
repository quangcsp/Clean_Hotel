class SearchesController < ApplicationController
  def index
  end

  def search
    # call custom json function with query and limit params
    hotels = Hotel.where('name LIKE ?', "%#{params[:q]}%").or(Hotel.where('address LIKE ?', "%#{params[:q]}%")).limit(params[:limit])
    results = []
    hotels.each do |h|
      results.push({
                       :title => h.name,
                       :image => h.avatar.url,
                       :url => "/hotels/#{h.id}",
                   })
    end
    # return json format
    render json: results
  end
end
