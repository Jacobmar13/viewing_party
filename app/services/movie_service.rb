class MovieService
  def get_api_data(uri)
    conn = Faraday.get("https://api.themoviedb.org/#{uri}") do |req|
      req.headers['Authorization'] = ENV['TMDB_API_KEY']
    end
    JSON.parse(conn.body, symbolize_names: true)
  end
end
