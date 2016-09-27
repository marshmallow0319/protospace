class Comment < ActiveRecord::Base
  belongs_to :prototype, counter_cache: :likes_count
  belongs_to :user
  validates :content, presence: true
end
