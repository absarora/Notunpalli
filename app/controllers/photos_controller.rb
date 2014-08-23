class PhotosController < ApplicationController
  respond_to :html, :js
  def new
    @photos = Photo.order('created_at DESC')
    @photo = Photo.new
  end
 
  def create
    respond_to do |format|
      @photo = Photo.new(photo_params)
      @photo.save
      format.html {redirect_to contents_gallery_path}
      format.js
    end
  end

  def new_multiple
    @photos = Photo.order('created_at DESC')
    @photo = Photo.new
  end

  def year_2014
    new_multiple
  end

  def year_2013
    new_multiple
  end

  def destroy
    @photo = Photo.find(params[:id])
    if @photo.destroy
      respond_to do |format|
        format.html { redirect_to :back }
        format.js
      end
    else
      flash[:error] = "Selected photo could not be deleted."
    end
  end
 
  private
 
  def photo_params
    params.require(:photo).permit(:image, :title)
  end
end