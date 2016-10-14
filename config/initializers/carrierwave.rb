CarrierWave.configure do |config|
    config.storage = :fog
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['ACCESS_KEY_ID'],
    aws_secret_access_key: ENV['SECRET_ACCESS_KEY'],
    region: 'us-east-1'
  }

    case Rails.env
    when 'development'
        config.strage = :fog
        config.fog_directory  = 'protospace-photo'
        config.asset_host = 'https://s3.amazonaws.com/protospace-photo'
    when 'production'
        config.strage = :fog
        config.fog_directory  = 'protospace-photo'
        config.asset_host = 'https://s3.amazonaws.com/protospace-photo'
    when 'test'
        config.strage = :file
    end
end
