class Like < ApplicationRecord
  belongs_to :user
  belongs_to :set_list
  validates_uniqueness_of :set_list_id, scope: :user_id
  
end
