class Friend < ApplicationRecord
  belongs_to :user
  belongs_to :user, foreign_key: 'friend_id', inverse_of: :friends
end
