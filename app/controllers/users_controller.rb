class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)
    if user.valid?
      cookies.signed[:session] = { value: user.id, expires: Time.now + 3600 }
      redirect_to links_path
    else
      flash[:error] = "Invalid registration. "
      user.errors.full_messages.each do |message|
        flash[:error] << message
      end
      redirect_to :back
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
