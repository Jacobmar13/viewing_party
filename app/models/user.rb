class User < ApplicationRecord
  has_many :friends
  has_many :viewing_parties, foreign_key: "organizer_id"
  has_many :guests, foreign_key: "guest_id"
end
