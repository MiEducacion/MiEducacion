# frozen_string_literal: true

class BaseUploader < CarrierWave::Uploader::Base
  include CarrierWave::BombShelter
  include CarrierWave::MiniMagick

  EXTENSION_ALLOWLIST = %w[jpg jpeg jpe gif png ico bmp dng].freeze
  FRAME_MAX = 500
  FRAME_STRIP_MAX = 150

  process :validate_frame_count
  process :strip_exif

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_allowlist
    EXTENSION_ALLOWLIST
  end

  def size_range
    1..(25.megabytes)
  end

  protected

  def strip_exif
    return if file.content_type.include?("svg")

    manipulate! do |image|
      image.strip unless image.frames.count > FRAME_STRIP_MAX
      image = yield(image) if block_given?
      image
    end
  end

  def validate_frame_count
    begin
      return unless MiniMagick::Image.new(file.path).frames.count > FRAME_MAX
    rescue Timeout::Error
      raise CarrierWave::IntegrityError, "Image processing timed out."
    end

    raise CarrierWave::IntegrityError, "GIF contains too many frames. Max frame count allowed is #{FRAME_MAX}."
  end
end
