class Friend < ApplicationRecord
  belongs_to :user
  belongs_to :each_friend, foreign_key: 'friend_id', class_name: 'User', inverse_of: :friends

  def friend_email
    User.find_by(id: self.friend_id).email
  end
end
