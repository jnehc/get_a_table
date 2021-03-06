class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

	def ensure_logged_in
	    unless current_user
	      flash[:alert] = "Please log in"
	      redirect_to new_session_path
	    end
  	end

end


# Helper methods are are use to share methods defined in the controller with the view. 
# This is use for any method that you need to access from both controllers and helpers/views. 
# Typical helper methods are not available in controllers.
# Create a current_user helper method to show the log in status of the user. 
# If the user is logged in we want to display "Signed in as [USERNAME]" or 
# else display "Login or Sign up"