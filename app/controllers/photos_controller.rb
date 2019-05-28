class PhotosController < ApplicationController
  before_action :set_desk, only: [:index, :create]

  def index
    @photo = Photo.new
    @photos = Photo.where(desk: @desk)
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.desk = @desk
    @photo.save
    redirect_to desk_photos_path(@desk)
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    @desk = @photo.desk
    redirect_to desk_photos_path(@desk)
  end

  private

  def photo_params
    params.require(:photo).permit(:data)
  end

  def set_desk
    @desk = Desk.find(params[:desk_id])
  end
end
