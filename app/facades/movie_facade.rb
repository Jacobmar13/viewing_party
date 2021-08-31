class MovieFacade
  def self.top_movies
    service = MovieService.new
    movies = service.get_api_data('3/movie/top_rated?language=en-US&page=1&region=US')[:results] + service.get_api_data('3/movie/top_rated?language=en-US&page=2&region=US')[:results]
    movies.map do |movie|
      MovieDetails.new(movie)
    end
  end

  def self.search_by_title(title)
    service = MovieService.new
    movies = service.get_api_data("3/search/movie?query=#{title}")[:results]
    movies.map do |movie|
      MovieDetails.new(movie)
    end
  end
end
