class Prototype < ActiveRecord::Base
  belongs_to :user
  has_many :photos
  has_many :likes, dependent: :destroy
  accepts_nested_attributes_for :photos, reject_if: proc { |attributes| attributes['content'].blank? }
  validates :title, :catch, :concept, presence: true

  def liked_user?(user)
   likes.find_by(user_id: user)
  end

end
