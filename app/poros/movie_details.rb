class MovieDetails
  attr_reader :id,
              :title,
              :vote_average
              
  def initialize(data)
    # not needed but may come in handy to know movie id given from api
    @id = data[:id]
    @title = data[:title]
    @vote_average = data[:vote_average]
end
