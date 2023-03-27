class PictureUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process resize_and_pad: [500, 500, background=:transparent, gravity='Center']

  version :medium do
    process resize_to_fill: [1080, 1080]
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end
end
  