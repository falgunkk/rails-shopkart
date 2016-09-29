# controllers created by coder inherits from this main controller.
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
end
