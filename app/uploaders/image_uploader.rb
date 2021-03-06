# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base

  storage :file
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}"
  end

  # リサイズしたり画像形式を変更するのに必要
  include CarrierWave::RMagick

  # 画像の上限を700pxにする
    process :resize_to_limit => [700, 700]

  # 保存形式をJPGにする
  process :convert => 'jpg'

  # サムネイルを生成する設定
  version :thumb do
    process :resize_to_fit => [80, 80]
  end
  # jpg,jpeg,gif,pngしか受け付けない
  def extension_white_list
    %w(jpg jpeg gif png)
  end

 # 拡張子が同じでないとGIFをJPGとかにコンバートできないので、ファイル名を変更
  def filename
    time = Time.now
    ts=time.strftime('%Y%m%d%H%M%S').downcase
    super.chomp(File.extname(super))+ ts + "" + '.jpg' if original_filename.present?
  end


end
