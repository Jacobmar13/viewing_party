class MovieService
  # def self.top_movies
  #   get_api_data('3/movie/top_rated?language=en-US&page=1&region=US') + get_api_data('3/movie/top_rated?language=en-US&page=2&region=US')
  # end

  def get_api_data(uri)
    conn = Faraday.get("https://api.themoviedb.org/#{uri}") do |req|
      req.headers['Authorization'] = ENV['TMDB_API_KEY']
    end
    JSON.parse(conn.body, symbolize_names: true)
  end
end
