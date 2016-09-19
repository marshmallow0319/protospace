class Prototype < ActiveRecord::Base
  belongs_to :user
  has_many :photos
  accepts_nested_attributes_for :photos, reject_if: proc { |attributes| attributes['content'].blank? }
  validates :title, :catch, :concept, presence: true
end
