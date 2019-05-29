class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :approved, :denied]
  before_action :set_desk, only: [:create]

  def index
    @bookings = current_user.bookings
  end

  def show
  end

  def new
    @booking = Booking.new
  end

  def create
    @user = current_user
    @booking = Booking.new(strong_params)
    @booking.status = 'pending'
    @booking.desk = @desk
    @booking.user = @user
    @booking.am & @booking.pm ? @booking.total_price = @desk.price : @booking.total_price = @desk.price / 2
    @booking.save ? (redirect_to bookings_path) : (render 'desk/show')
  end

  def approved
    @booking.status = 'accepted'
    @booking.save
    redirect_to desk_path(@booking.desk)
  end

  def denied
    @booking.status = 'denied'
    @booking.save
    redirect_to desk_path(@booking.desk)
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_desk
    @desk = Desk.find(params[:desk_id])
  end

  def strong_params
    params.require(:booking).permit(:date, :am, :pm, :desk_id, :user_id, :status)
  end
end
