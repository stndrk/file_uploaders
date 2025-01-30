# frozen_string_literal: true

class AddDetailsToUploadedFiles < ActiveRecord::Migration[8.0]
  def change
    change_table :uploaded_files, bulk: true do |t|
      t.string :file_path
      t.string :send_status
      t.boolean :send_mail, default: false, null: false
      t.text :other_data
      t.string :file_url
    end
  end
end
