class AssetsController < ApplicationController
  respond_to :json

  def create
    @asset = current_community.assets.new(asset_params)
    @asset.author = current_user
    @asset.save
    render :show
  end

  def show
    @asset = current_community.assets.find(param[:id])
    respond_with @asset
  end

  private

  def asset_params
    params.require(:asset).permit(:file)
  end
end