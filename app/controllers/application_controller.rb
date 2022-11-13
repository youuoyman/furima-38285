class ApplicationController < ActionController::Base
  before_action :basic_auth
<<<<<<< Updated upstream

=======
  before_action :configure_permitted_parameters, if: :devise_controller?
  
>>>>>>> Stashed changes
  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
end
