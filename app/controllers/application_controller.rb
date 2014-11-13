class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from ActiveRecord::RecordNotFound do |exception|
    render file: 'public/404.html', status: :not_found, layout: false
  end

  protected
    def authenticate
      if session[:person_id]
        @current_person = Person.find(session[:person_id])
      else
        redirect_to login_path
      end
    end

end
