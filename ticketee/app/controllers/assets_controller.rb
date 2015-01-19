class AssetsController < ApplicationController
  def show
    asset = Asset.find(params[:id])
    authorize asset, :show?
    send_file asset.asset.path, disposition: :inline
  end
end