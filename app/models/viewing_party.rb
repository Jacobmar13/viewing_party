class ViewingParty < ApplicationRecord
  has_many :guests, foreign_key: 'party_id', inverse_of: :viewing_party, dependent: nil
  belongs_to :user, foreign_key: 'organizer_id', inverse_of: :viewing_parties

  validates :duration, presence: true
  validates :start_time, presence: true
  validates :date, presence: true

  def movie_title
    movie = MovieFacade.movie_info_by_id(self.movie_id)
    movie.title
  end
end
