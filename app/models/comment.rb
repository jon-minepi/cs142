class Comment < ApplicationRecord
  belongs_to :photo
  belongs_to :user

  validates :comment, :photo_id, :user_id, :date_time, presence: true
end
