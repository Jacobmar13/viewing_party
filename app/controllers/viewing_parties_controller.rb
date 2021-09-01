class ViewingPartiesController < ApplicationController
  def new
    @movie_info = MovieFacade.movie_info_by_id(session[:movie_details]['movie_id'].to_i)
  end

  def create
    if party_params[:duration].to_i < session[:movie_details]['duration']
      flash[:error] = 'Duration cannot be shorter then movie runtime'
      redirect_to viewing_party_new_path
    else
      party = ViewingParty.create(party_params)
      guests = friend_params[:friend].delete_if { |friend| friend == ""}
      if party.id.nil?
        flash[:error] = party.errors.full_messages
        redirect_to viewing_party_new_path
      else
        guests.each { |guest| Guest.create!(party_id: party.id, guest_id: guest) }
        session[:movie_details] = nil
        redirect_to user_path(current_user.id)
      end
    end
  end

  private

  def party_params
    params.permit(:duration, :date, :start_time)
          .merge(organizer_id: current_user.id, movie_id: session[:movie_details]['movie_id'])
  end

  def friend_params
    params.permit({friend: []})
  end
end
