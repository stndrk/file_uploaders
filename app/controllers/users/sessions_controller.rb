# frozen_string_literal: true

# app/controllers/users/sessions_controller.rb
class Users::SessionsController < Devise::SessionsController
  def create
    super
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "User not found, please sign up!"
    redirect_to new_user_registration_path
  end

  def after_sign_in_path_for(_resource)
    dashboard_path
  end
end
