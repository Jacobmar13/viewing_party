class UsersController < ApplicationController
  def show
    binding.pry
  end

  def authenticate
    redirect_to root_path
  end
end
