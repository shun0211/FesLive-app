class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :set_list
end
