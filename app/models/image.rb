class Image < ApplicationRecord
  belongs_to :event
  belongs_to :user
  has_many :comment_to_images
  mount_uploader :photograph, ImageUploader
  has_many :likes

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end

  def sorted
    like_number = images.likes.group(:image_id).count
    binding.pry
    images_sorted = like_number.keys.compact.sort
    # => [2, 4, 1 ...] いいねが多い写真のid順に入っている
    all_images_id = Image.all.ids
    all_images_sorted = images_sorted.push(all_images_id).flatten!.uniq!
    @images = Image.find(all_images_sorted)
  end

end
