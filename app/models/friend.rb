class Friend < ApplicationRecord
  belongs_to :user
  belongs_to :each_friend, foreign_key: 'friend_id', class_name: 'User'
end
