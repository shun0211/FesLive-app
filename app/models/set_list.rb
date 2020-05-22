class SetList < ApplicationRecord
  belongs_to :event, optional: true

  validates :artist, :first_song, presence: true
  validates :artist, uniqueness: true
end
