# frozen_string_literal: true

class AddDetailsToUploadedFiles < ActiveRecord::Migration[8.0]
  def change
    add_column :uploaded_files, :file_path, :string
    add_column :uploaded_files, :send_status, :string
    add_column :uploaded_files, :send_mail, :boolean
    add_column :uploaded_files, :other_data, :text
    add_column :uploaded_files, :file_url, :string
  end
end
