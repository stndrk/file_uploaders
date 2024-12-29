# frozen_string_literal: true

class FileMailer < ApplicationMailer
  def share_file(file_upload, recipient_email, file_path, _tiny_url)
    @file_upload = file_upload
    @recipient_email = recipient_email

    attachments[@file_upload.title + File.extname(file_path)] = File.read(file_path)
    mail(to: @recipient_email, from: ENV.fetch("OFFICE365_USERNAME", nil), subject: "Shared File: #{@file_upload.title})") do |format|
      format.text { render plain: "You have received a file: #{@file_upload.title}. You can access it via the following link: #{@tiny_url}" }
    end
  end
end
