class Api::V1::LinksController < ApplicationController
  def update
    respond_with Link.find(params[:id]).update!(link_params)
  end

  private

  def link_params
    params.require(:link).permit(:url, :title, :read)
  end
end
