class Photo < ActiveRecord::Base
  belongs_to :prototype
  enum status: { main: 0, sub: 1 }
  mount_uploader :content, ImageUploader
  validates_presence_of :status
end
