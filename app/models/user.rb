class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validates :password, presence: true

  has_many :friends, dependent: nil
  has_many :each_friend, through: :friends
  has_many :viewing_parties, foreign_key: 'organizer_id', inverse_of: :user, dependent: nil
  has_many :guests, foreign_key: 'guest_id', inverse_of: :user, dependent: nil

  has_secure_password

  def friend_info
    self.friends.map do |friend|
      User.where(id: friend.friend_id)
    end.flatten
  end
end
