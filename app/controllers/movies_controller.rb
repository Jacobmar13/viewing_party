class MoviesController < ApplicationController
  def discover; end

  def movies
    if params[:filter].nil?
      @movies = MovieFacade.top_movies
    elsif params[:filter].present?
      @movies = MovieFacade.search_by_title(params[:filter])
    end
  end
end
