require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  if Rails.env.production?
    config.storage :fog
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['S3_ACCESS_KEY'],
      aws_secret_access_key: ENV['S3_SECRET_KEY'],
      region: 'ap-northeast-1'
    }
    config.fog_directory  = 'midplot'
    config.fog_public = false
    config.fog_attributes = { 'x-amz-acl' => 'private' }
  else
    config.storage :file
    config.enable_processing = Rails.env.development?
  end
end
