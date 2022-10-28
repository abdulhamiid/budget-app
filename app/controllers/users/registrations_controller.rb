class Users::RegistrationsController < Devise::RegistrationsController
  # Override the action you want here.
  private
  def after_sign_up_path_for(_resource)
    groups_path
  end
end
