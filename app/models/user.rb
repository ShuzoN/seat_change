class User < ActiveRecord::Base
  after_initialize :set_default_position

  mount_uploader :image, ImageUploader
  validates_presence_of :nick_name, :image, :position 
  validates_uniqueness_of :nick_name
  validates :image, format: { with: /[\w-]+\.jpg|jpeg|gif|png/ }

  def get_latest_position
    return 0 if User.all.empty?
    return User.order("position DESC").first.position+1
  end

  private
  def set_default_position
    self.position ||= get_latest_position
  end
end
