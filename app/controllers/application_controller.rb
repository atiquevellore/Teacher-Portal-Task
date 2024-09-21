# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # navigation to Students After login
  def after_sign_in_path_for(_resource)
    students_path
  end
end
