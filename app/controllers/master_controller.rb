class MasterController < ApplicationController
  def index
    redirect_to links_path if cookies.signed[:session]
  end
end
