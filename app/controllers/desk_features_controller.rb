class DeskFeaturesController < ApplicationController
  def create
    @desk_feature = DeskFeature.new(strong_params)
    @desk_features.desk = @desk
  end

  def destroy
  end

  def strong_params
    params.require(:DeskFeature).permit(:value)
  end
end

