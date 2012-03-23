class RegistrationsController < Devise::RegistrationsController 
  protected

  def after_sign_up_path_for(resource)
    edit_list_path resource.lists.default
  end

  def after_inactive_sign_up_path_for(resource)
    after_sign_up_path_for(resource)
  end

end
