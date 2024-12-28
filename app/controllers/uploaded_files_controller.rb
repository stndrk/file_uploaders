# frozen_string_literal: true

# app/controllers/uploaded_files_controller.rb
class UploadedFilesController < ApplicationController
  before_action :authenticate_user!

  def new
    @file_upload = UploadedFile.new
  end

  def create
    @file_upload = UploadedFile.new(uploaded_file_params)
    @file_upload.user = current_user

    if uploaded_file_params[:file].present?
      original_filename = uploaded_file_params[:file].original_filename
      extension = File.extname(original_filename)

      new_filename = "#{@file_upload.title}#{extension}"

      upload_folder = Rails.public_path.join("uploads")
      FileUtils.mkdir_p(upload_folder)

      file_path = upload_folder.join(new_filename)
      file_url = "/uploads/#{new_filename}"

      File.binwrite(file_path, uploaded_file_params[:file].read)

      @file_upload.file_path = file_path.to_s
      @file_upload.file_url = file_url

      if @file_upload.save
        redirect_to dashboard_path, notice: "File uploaded successfully."
      else
        render :new, alert: "Failed to upload the file."
      end
    else
      render :new, alert: "No file selected."
    end
  end

  def destroy
    @uploaded_file = current_user.uploaded_files.find(params[:id])

    if @uploaded_file.destroy
      redirect_to dashboard_path, notice: "File deleted successfully!"
    else
      redirect_to dashboard_path, alert: "Failed to delete the file."
    end
  end

  def share
    @uploaded_files = current_user.uploaded_files
  end

  def send_file_email
    @file_upload = UploadedFile.find(params[:file_id])
    recipient_email = params[:email]
    file_path = Rails.public_path.join("uploads", "#{@file_upload.title}#{File.extname(@file_upload.file_path)}")

    if File.exist?(file_path)
      FileMailer.share_file(@file_upload, recipient_email, file_path).deliver_now
      redirect_to dashboard_path, notice: "File has been shared successfully!"
    else
      redirect_to dashboard_path, alert: "File not found. Please try again."
    end
  end

  private

  def uploaded_file_params
    params.require(:uploaded_file).permit(:title, :description, :file)
  end

  def generate_short_url(long_url)
    UrlShortener.shorten(long_url)
  end
end
