class ViewingParty < ApplicationRecord
  has_many :guests, foreign_key: 'party_id', inverse_of: :viewing_party, dependent: nil
  belongs_to :user, foreign_key: 'organizer_id', inverse_of: :viewing_parties
end
