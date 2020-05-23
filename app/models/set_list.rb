class SetList < ApplicationRecord
  belongs_to :event, optional: true
  belongs_to :user
  has_many :likes, dependent: :destroy

  validates :artist, :first_song, presence: true
  validates :artist, uniqueness: true

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
end
