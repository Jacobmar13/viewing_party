class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = user_params
    user[:email] = user[:email].downcase
    if user_params[:password] == user_params[:password_confirmation]
      User.create(user_params)
      flash[:success] = "Registration successful. Please log in!"
      redirect_to root_path
    else
      flash[:error] = "Passwords do not match!"
      redirect_to new_user_path
    end
  end

  def show
  end

  def authenticate
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
