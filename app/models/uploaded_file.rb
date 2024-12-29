# frozen_string_literal: true

# app/models/uploaded_file.rb
class UploadedFile < ApplicationRecord
  belongs_to :user
  has_one_attached :file

  # Validations
  validates :title, :description, presence: true
  validates :file, presence: true
  validate :correct_file_size

  before_save :compress_file

  private

  # Custom validation to check for file size (max 1 GB)
  def correct_file_size
    return unless file.attached?

    max_size = 1.gigabyte
    return unless file.byte_size > max_size

    errors.add(:file, "File size cannot be greater than 1 GB.")
  end

  # Compress file before saving (if image)
  def compress_file
    return unless file.attached? && file.content_type.start_with?("image")

    io = MiniMagick::Image.read(file.download)
    io.resize "800x800"
    io.write(file.path)
  end
end
