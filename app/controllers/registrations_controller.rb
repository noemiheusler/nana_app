class RegistrationsController < Devise::RegistrationsController

  protected

  def after_sign_up_path_for(resource)
    onboarding_path
  end

  def after_update_path_for(resource)
    profile_path
  end

end
