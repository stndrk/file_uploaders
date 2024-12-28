# frozen_string_literal: true

class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def show
    @uploaded_files = current_user.uploaded_files
  end
end
