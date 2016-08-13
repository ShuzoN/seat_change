class User < ActiveRecord::Base
  after_initialize :set_default_value

  mount_uploader :image, ImageUploader
  validates_presence_of :nick_name, :image, :position 
  validates_uniqueness_of :nick_name
  validates :image, format: { with: /[\w-]+\.jpg|jpeg|gif|png/ }

  def get_recent_position
  end

  private
  def set_default_value
    self.position ||= 1
  end
end
