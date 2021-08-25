class Guest < ApplicationRecord
  belongs_to :user, foreign_key: 'guest_id', inverse_of: :guests
  belongs_to :viewing_party, foreign_key: 'party_id', inverse_of: :guests
end
