class MovieFacade
  def self.top_movies
    service = MovieService.new
    movies = service.get_api_data('/3/movie/top_rated?language=en-US&page=1&region=US')[:results] + get_api_data('/3/movie/top_rated?language=en-US&page=2&region=US')[:results]
  end
end
