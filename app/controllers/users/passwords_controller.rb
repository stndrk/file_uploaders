# frozen_string_literal: true

# app/controllers/users/passwords_controller.rb
class Users::PasswordsController < Devise::PasswordsController
  def create
    user = User.find_by(email: params[:user][:email])

    if user
      super
    else
      flash[:error] = "No account found with that email address."
      redirect_to new_user_registration_path
    end
  end
end
