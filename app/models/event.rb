class Event < ApplicationRecord
  has_many :set_lists
  mount_uploader :event_image, ImageUploader
end
