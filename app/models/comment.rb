class Comment < ApplicationRecord
  belongs_to :photo
  belongs_to :user

  validates :comment, :photo_id, :user_id, :date_time, presence: true

  def parent_user
    User.find(user_id)
  end

  def parent_photo
    Photo.find(photo_id)
  end

end
