require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html

  protect_from_forgery
  rescue_from CanCan::AccessDenied do |exception|
		if exception.subject.class.name == "Journal"
			redirect_to new_user_session_path, :alert => "Please login to create a Journal" 
		else
			redirect_to root_path, :alert => exception.message
		end
	end
end
