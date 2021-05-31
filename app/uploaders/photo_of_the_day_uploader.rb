class PhotoOfTheDayUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage Rails.env.production? ? :fog : :file

  def store_dir
    "uploads/photo_of_the_day"
  end
end
