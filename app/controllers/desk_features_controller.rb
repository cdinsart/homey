class DeskFeaturesController < ApplicationController
  def create
    # @desk = Desk.find(params[:desk_id])
    # @desk_feature.desk = @desk
    # @feature = Feature.find(params[:feature_id])
    # @desk_feature.features = @features
    # @desk_feature = DeskFeature.new(strong_params)
    # if @desk_feature.save
    #   redirect_to desk_path(@desk)
    # else
    #   render 'new'
    # end
  end

  def destroy
    # @desk_feature = DeskFeature.find(params[:id])
    # @desk_feature.destroy
    # @desk = @desk_feature.desk
    # redirect_to desk_path(@desk)
  end

  # def strong_params
  #   params.require(:DeskFeature).permit(:value)
  # end
end

