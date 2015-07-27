class Item < ActiveRecord::Base
  validates :name, :picture, presence: :true
  mount_uploader :picture, PictureUploader
end
