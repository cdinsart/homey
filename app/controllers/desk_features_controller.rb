class DeskFeaturesController < ApplicationController
  def new
    @desk = Desk.find(params[:desk_id])
    @desk_feature = DeskFeature.new
    @features = Feature.all
  end

  def create
    @desk = Desk.find(params[:desk_id])
    @desk_feature = DeskFeature.new(strong_params)
    @desk_feature.desk = @desk
    @desk_feature.save
    redirect_to new_desk_desk_feature_path(@desk)
    # else
    #   render 'new'
    # end
  end

  def edit
  end

  def update
  end

  def destroy
    @desk_feature = DeskFeature.find(params[:id])
    @desk = @desk_feature.desk
    @desk_feature.destroy
    redirect_to new_desk_desk_feature_path(@desk)
  end

  def strong_params
    params.require(:desk_feature).permit(:value, :feature_id)
  end
end
