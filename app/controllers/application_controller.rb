class ApplicationController < ActionController::Base
 protect_from_forgery with: :exception
#   protect_from_forgery prepend: true
#   def facebook_logout
#     split_token = session["devise.facebook_data"].split("|")
#     fb_api_key = split_token[0]
#     fb_session_key = split_token[1]
#     redirect_to "http://www.facebook.com/logout.php?api_key=#{fb_api_key}&session_key=#{fb_session_key}&confirm=1&next=#{destroy_user_session_url}";
#   end
 end
