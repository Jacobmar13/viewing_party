class MoviesController < ApplicationController
  before_action :require_login

  def discover
    @user = current_user
  end

  def movies
    if params[:filter].nil?
      @movies = MovieFacade.top_movies
    elsif params[:filter].present?
      @movies = MovieFacade.search_by_title(params[:filter])
    end
  end

  def show
    @user = current_user
    @movie = MovieFacade.movie_info_by_id(params[:movie_id])
    @movie_cast = MovieFacade.movie_cast(params[:movie_id])
    @movie_reviews = MovieFacade.movie_reviews(params[:movie_id])
  end
end
