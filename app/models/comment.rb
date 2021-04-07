class Comment < ApplicationRecord
  belongs_to :photo
  belongs_to :user

  def user
    User.find(user_id)
  end
end
