class BookingsController < ApplicationController
  before_action :set_booking, only: [:approved, :denied]
  before_action :set_desk, only: :create
  before_action :set_desk_rating, only: :show

  def index
    @guest_bookings = current_user.bookings
    @bookings = Booking.all
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
    @booking.am & @booking.pm ? @booking.amount = @desk.price : @booking.amount = @desk.price / 2
    @booking.save ? (redirect_to booking_path(@booking)) : (render 'desk/show')
  end

  def approved
    @booking.status = 'accepted'
    @booking.save
    redirect_to bookings_path
  end

  def denied
    @booking.status = 'declined'
    @booking.save
    redirect_to bookings_path
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_desk
    @desk = Desk.find(params[:desk_id])
  end

  def strong_params
    params.require(:booking).permit(:date, :am, :pm, :desk_id, :user_id, :status, :state, :payment)
  end

  def set_desk_rating
    @booking = Booking.find(params[:id])
    @desk = @booking.desk
    sum = 0
    @desk.reviews.each do |review|
      sum += review.desk_rating
    end
    @desk_rating = sum / @desk.reviews.length if @desk.reviews.any?
  end
end
