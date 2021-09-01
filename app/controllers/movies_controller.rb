class MoviesController < ApplicationController
  before_action :require_login

  def discover
  end

  def movies
    if params[:filter].nil?
      @movies = MovieFacade.top_movies
    elsif params[:filter].present?
      @movies = MovieFacade.search_by_title(params[:filter])
    end
  end

  def show
    @movie = MovieFacade.movie_info_by_id(params[:movie_id])
    @movie_cast = MovieFacade.movie_cast(params[:movie_id])
    @movie_reviews = MovieFacade.movie_reviews(params[:movie_id])
    session[:movie_details] = {movie_id: params[:movie_id], duration: @movie.runtime, movie_title: @movie.title}
  end
end
