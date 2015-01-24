class AssetsController < ApplicationController
  skip_after_action :verify_authorized, only: [:new]

  def new
    @index = params[:index].to_i
    @ticket = Ticket.new
    @ticket.assets.build
    render layout: false
  end

  def show
    asset = Asset.find(params[:id])
    authorize asset, :show?
    send_file asset.asset.path, disposition: :inline
  end
end