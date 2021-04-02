class Photo < ApplicationRecord
  belongs_to :user
  has_many :comments

  def all_comments
    Comment.where(photo_id: id)
  end
end
