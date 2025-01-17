class MovieInfo
  attr_reader :title,
              :vote_average,
              :runtime,
              :genres,
              :summary

  def initialize(data)
    @title = data[:title]
    @vote_average = data[:vote_average]
    @runtime = data[:runtime]
    @genres = data[:genres]
    @summary = data[:overview]
  end
end
