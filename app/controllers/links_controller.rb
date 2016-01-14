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

  def edit
    @link = Link.find(params[:id])
    unless User.find(cookies.signed[:session]).links.include?(@link)
      flash[:error] = "Unauthorized access."
      redirect_to :back and return
    end
  end

  def update
    link = Link.find_by(id: params[:id]).update(link_params)
    unless link
      flash[:error] = "Bad URL location. Please doublecheck that before trying again."
      redirect_to :back and return
    end
    redirect_to links_path
  end

  private

  def link_params
    params.require(:link).permit(:title, :url)
  end
end
