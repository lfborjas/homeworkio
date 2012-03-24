class HomeController < ApplicationController
  def index
    return redirect_to edit_list_path(current_user.lists.default) if current_user.try(:default_list_empty?)
    return redirect_to new_homework_path if current_user.try(:no_homeworks?)
    return redirect_to homeworks_path if user_signed_in?
  end
end
