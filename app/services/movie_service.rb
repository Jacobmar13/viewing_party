class MovieService
  def self.top_movies
    get_api_data('https://api.themoviedb.org/3/movie/top_rated?language=en-US&page=1&region=US') + get_api_data('https://api.themoviedb.org/3/movie/top_rated?language=en-US&page=2&region=US')
  end

  def get_api_data(uri)
    conn = Faraday.new(url: 'https://api.themoviedb.org/').get(uri) do |req|
      req.headers['Authorization'] = ENV['TMDB_API_KEY']
      binding.pry
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end
