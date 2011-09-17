class ApplicationController < ActionController::Base
  protect_from_forgery
  
  protected
  
  def authorize
		unless admin?
			flash[:error] = "Unauthorized access"
			redirect_to root_url
			false
		end
	end
  
  private
	
	def admin?
		current_user
		unless @current_user.nil?
			return @current_user.admin?
		else
			return false
		end
	end
	helper_method :admin?
	
	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end
	helper_method :current_user
end
