class SessionsController < ApplicationController
  def new
    
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      cookies.signed[:session] = { value: user.id, expires: Time.now + 3600 }
      redirect_to links_path
    else
      flash[:error] = "Check your credentials."
      redirect_to :back
    end
  end

  def destroy
    cookies.delete(:session)
    redirect_to login_path
  end
end
