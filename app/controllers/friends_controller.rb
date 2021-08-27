class FriendsController < ApplicationController
  def create
    friend = User.find_by(email: params[:email])
    x = Friend.create!(user_id: params[:user_id], friend_id: friend.id)
    redirect_to user_path(params[:user_id])
  end
end
