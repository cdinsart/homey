class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def new
    # @user = current_user
    @review = Review.new
    @booking = Booking.find(params[:booking_id])
    @desk = @booking.desk
  end

  def create

    # @booking = Booking.find(params[:booking_id])

    @review = Review.new(review_params)
    @review.save
    redirect_to bookings_path
  end

  private

  def review_params
    params.require(:review).permit(:content, :desk_rating)
  end
end
