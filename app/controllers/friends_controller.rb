class FriendsController < ApplicationController
  def create
    if User.exists?(email: params[:email])
      friend = User.find_by(email: params[:email])
      Friend.create!(user_id: params[:user_id], friend_id: friend.id)
    else
      flash[:error] = "I'm sorry, your friend cannot be found."
    end
    redirect_to user_path(params[:user_id])
  end
end
