Dotenv::Railtie.load

CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider => 'AWS',
    :aws_access_key_id => ENV["AWS_ACCESS_KEY_ID"],
    :aws_secret_access_key => ENV["AWS_SECRET_ACCESS_KEY"],
    :region => 'nyc3',
    :endpoint => 'https://nyc3.digitaloceanspaces.com',
    :host => 'nyc3.digitaloceanspaces.com'
  }
  config.fog_directory = ENV["FOG_DIRECTORY"]
  config.fog_attributes = { 'Cache-Control' => 'max-age=315576000' }
end
