# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base

  storage :file
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # リサイズしたり画像形式を変更するのに必要
  include CarrierWave::RMagick

  # 保存形式をJPGにする
  process :convert => 'jpg'

  # サムネイルを生成する設定
  version :thumb do
    # process :resize_to_fill => [40, 40, gravity = ::Magick::CenterGravity]
    process :resize_to_fit => [40, 40]
  end

end
