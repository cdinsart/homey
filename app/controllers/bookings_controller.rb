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
    case [@booking.am, @booking.pm].count(true)
    when 0
      redirect_to desk_path(@desk), notice: 'Select at least one time slot' && return
    when 1
      @booking.amount = @desk.price / 2
    when 2
      @booking.amount = @desk.price
    end
    redirect_to (@booking.save ? booking_path(@booking) : desk_path(@desk))
  end

  def approved
    @booking.status = 'accepted'
    @booking.save
    redirect_to bookings_path(anchor: "host")
  end

  def denied
    @booking.status = 'declined'
    @booking.save
    redirect_to bookings_path(anchor: "host")
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
