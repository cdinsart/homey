class DesksController < ApplicationController
  before_action :set_desk, only: [:show, :edit, :update, :destroy]

  def my_desks
    @desks = current_user.desks.where(active: true)
  end

  def index
    @desks = desks.all.where(active: true)
  end

  def show
    if @desk.active == false
      redirect_to root_path
      flash[:alert] = "Sorry this desk doesn't exist anymore"
    end
  end

  def new
    @desk = Desk.new
  end

  def create
    @desk = Desk.new(strong_params)
    @desk.user = current_user
    if @desk.save
      redirect_to my_desks_path
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
    params.require(:desk).permit(:title, :address, :price, :description, :user_id)
  end

  def set_desk
    @desk = Desk.find(params[:id])
  end
end
