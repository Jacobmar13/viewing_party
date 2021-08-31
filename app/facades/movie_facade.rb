class MovieFacade
  def self.top_movies
    service = MovieService.new
    # rubocop:disable Layout/LineLength
    movies = service.get_api_data('3/movie/top_rated?language=en-US&page=1&region=US')[:results] + service.get_api_data('3/movie/top_rated?language=en-US&page=2&region=US')[:results]
    # rubocop:enable Layout/LineLength
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

  def self.movie_info_by_id(movie_id)
    service = MovieService.new
    movie = service.get_api_data("3/movie/#{movie_id}")
    MovieInfo.new(movie)
  end

  def self.movie_cast(movie_id)
    service = MovieService.new
    movie = service.get_api_data("3/movie/#{movie_id}/credits")[:cast]
    movie.map do |cast|
      MovieCredits.new(cast)
    end.first(10)
  end

  def self.movie_reviews(movie_id)
    service = MovieService.new
    movie = service.get_api_data("3/movie/#{movie_id}/reviews")[:results]
    movie.map do |review|
      MovieReviews.new(review)
    end
  end
end
