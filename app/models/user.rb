class User < ActiveRecord::Base
  belongs_to :image
  mount_uploader :image, ImageUploader
end
