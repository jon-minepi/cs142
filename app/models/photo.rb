class Photo < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :file_name, :date_time, :user, presence: true
end
