class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	before_action :devise_permitted_parameters, if: :devise_controller?
	protected
	def devise_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:email,:password,:password_confirmation,:avatar])
		devise_parameter_sanitizer.permit(:sign_in, keys: [:email,:password])
		devise_parameter_sanitizer.permit(:account_update, keys:[:email,:password,:password_confirmation,:avatar])
	end
end
