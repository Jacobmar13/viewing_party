class Guest < ApplicationRecord
  belongs_to :user, foreign_key: 'guest_id'
  belongs_to :viewing_party, foreign_key: 'party_id'
end
