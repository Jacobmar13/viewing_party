class MoviesController < ApplicationController
  def index
    # if params[:filter].nil?
    #   @movies = MovieFacade.top_movies
    # elsif params[:filter].present?
    #   @movies = MovieFacade.search_by_title(params[:filter])
    # else
    #   @movies = []
    # end
  end
end
