class LinksController < ApplicationController
  def index
    @user = User.includes(:links).find(cookies.signed[:session])
    @new_link = Link.new(user_id: cookies.signed[:session])
  end

  def create
    user = User.find(cookies.signed[:session])
    link = user.links.create(link_params)
    unless link.valid?
      flash[:error] = "Bad URL location. Please doublecheck that before trying again."
    end
    redirect_to links_path
  end

  private

  def link_params
    params.require(:link).permit(:title, :url)
  end
end
