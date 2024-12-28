# frozen_string_literal: true

# app/models/uploaded_file.rb
class UploadedFile < ApplicationRecord
  belongs_to :user
  has_one_attached :file

  # Validations
  validates :title, :description, presence: true
  validates :file, presence: true
  validate :correct_file_type

  before_save :compress_file

  private

  # Custom validation to check for allowed content types
  def correct_file_type
    allowed_content_types = ["image/png", "image/jpg", "image/jpeg", "application/pdf", "application/zip", "application/msword", "application/vnd.openxmlformats-officedocument.wordprocessingml.document", "text/plain"]

    return unless file.attached? && allowed_content_types.exclude?(file.content_type)

    errors.add(:file, "must be a valid file type")
  end

  # Compress file before saving (if image)
  def compress_file
    return unless file.attached? && file.content_type.start_with?("image")

    io = MiniMagick::Image.read(file.download)
    io.resize "800x800"
    io.write(file.path)
  end
end
