class Image < ApplicationRecord
  belongs_to :event
  belongs_to :user
  has_many :comment_to_images
  mount_uploader :photograph, ImageUploader
  has_many :image_likes

  def liked_by?(user)
    image_likes.where(user_id: user.id).exists?
  end

end
