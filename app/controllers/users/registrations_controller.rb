# frozen_string_literal: true

# app/controllers/users/registrations_controller.rb
class Users::RegistrationsController < Devise::RegistrationsController
  def create
    @user = User.find_by(email: user_params[:email])

    if @user
      flash[:alert] = "This email is already registered. Please log in or use a different email."
      redirect_to new_user_registration_path
    else
      @user = User.new(user_params)

      if @user.save
        flash[:notice] = "Registration successful! Please log in."
        redirect_to new_user_session_path
      else
        render :new
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
