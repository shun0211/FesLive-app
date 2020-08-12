class Event < ApplicationRecord
  has_many :set_lists
  has_many :images
  mount_uploader :event_image, ImageUploader
end
