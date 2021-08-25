class ViewingParty < ApplicationRecord
  has_many :guests, foreign_key: "party_id"
  belongs_to :user, foreign_key: "organizer_id"
end
