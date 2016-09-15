class Prototype < ActiveRecord::Base
  belongs_to :user
  has_many :photos
  accepts_nested_attributes_for :photos
  validates :title, :catch, :concept, presence: true
end
