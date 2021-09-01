class Guest < ApplicationRecord
  belongs_to :user, foreign_key: 'guest_id', inverse_of: :guests
  belongs_to :viewing_party, foreign_key: 'party_id', inverse_of: :guests

  def find_party
    ViewingParty.find_by(id: party_id)
  end
end
