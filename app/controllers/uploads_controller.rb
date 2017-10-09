class UploadsController < ApplicationController
  def create
    p = Picture.new
    p.photo = params[:files].first
    p.save
    respond_to do |format|
      res = { files: [ { url: p.photo.url }]}
      format.json { render json: res.to_json }
    end
  end
end
