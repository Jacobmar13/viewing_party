class User < ApplicationRecord
  has_many :friends, dependent: nil
  has_many :friends, foreign_key: 'friend_id', inverse_of: :user, dependent: nil
  has_many :viewing_parties, foreign_key: 'organizer_id', inverse_of: :user, dependent: nil
  has_many :guests, foreign_key: 'guest_id', inverse_of: :user, dependent: nil

  has_secure_password
end
