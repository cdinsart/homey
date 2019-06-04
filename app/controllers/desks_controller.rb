class DesksController < ApplicationController
  before_action :set_desk, only: [:show, :edit, :update, :destroy]
  before_action :set_desk_rating, only: :show
  skip_before_action :authenticate_user!, only: [:index, :show]

  def my_desks
    @desks = current_user.desks.where(active: true)
  end

  def index
    @photos = Photo.where(desk: @desk)
    if params[:location].present?
      @desks = Desk.near(params[:location], 100).where(active: true)
    else
      @desks = Desk.where(active: true)
    end
  end

  def show
    # photo per desk
    @photos = Photo.where(desk: @desk)
    @booking = Booking.new
    #show only the active desks
    if @desk.active == false
      redirect_to root_path
      flash[:alert] = "Sorry this desk doesn't exist anymore"
    end
    # available features
    @available_desk_features = []
    @desk_features = @desk.desk_features
    @desk_features.each do |d|
      @available_desk_features << d.feature
    end
    # unavailable features
    @features = Feature.all
    @unavailable_desk_features = []
    @features.each do |f|
      if f.desk_features.where(desk_id: @desk).empty?
      @unavailable_desk_features << f
      end
    end
    # addition of the 2 arrays
    @allfeatures = @available_desk_features.concat(@unavailable_desk_features)
    # map
    @markers = [{
      lat: @desk.latitude,
      lng: @desk.longitude,
      infoWindow: render_to_string(partial: "infowindow", locals: { desk: @desk }),
      image_url: helpers.asset_url('map_pin.png')
    }]
  end

  def new
    @desk = Desk.new
  end

  def create
    @desk = Desk.new(strong_params)
    @desk.user = current_user
    if @desk.save
      # redirect_to :controller => 'desk_features', :action => 'new'
      redirect_to new_desk_desk_feature_path(@desk)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @desk.update(strong_params)
    redirect_to desk_path(@desk)
  end

  def destroy
    @desk.active = false
    @desk.save
    redirect_to my_desks_path
  end

  private

  def strong_params
    params.require(:desk).permit(:title, :address, :price, :description)
  end

  def set_desk
    @desk = Desk.find(params[:id])
  end

  def set_desk_rating
    @desk = Desk.find(params[:id])
    sum = 0
    @desk.reviews.each do |review|
      sum += review.desk_rating
    end
    @desk_rating = sum / @desk.reviews.length if @desk.reviews.any?
  end
end
