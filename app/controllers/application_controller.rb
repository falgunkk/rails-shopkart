# controllers created by coder inherits from this main controller.
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  #protect_from_forgery with: :null_session
  def after_sign_in_path_for(user)
    '/categories'
  end

end
