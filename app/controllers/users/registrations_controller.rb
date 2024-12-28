# frozen_string_literal: true

# app/controllers/users/registrations_controller.rb
class Users::RegistrationsController < Devise::RegistrationsController
  def create
    user = User.find_by(email: params[:user][:email])

    if user
      flash[:error] = "No account found with that email address."
      redirect_to user_session_path
    else
      super
      if resource.persisted?
        flash[:notice] = "Registration successful! Please log in."
        redirect_to new_user_session_path
      end
    end
  end
end
