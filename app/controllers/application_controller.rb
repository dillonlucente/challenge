class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from ActiveRecord::RecordNotFound do |exception|
    render file: 'public/404.html', status: :not_found, layout: false
  end

  def signed_in?
    session[:person_id] && Person.find(session[:person_id])
  end

  def current_user
    Person.find(session[:person_id]) if session[:person_id]
  end

  protected
    def authenticate
      redirect_to login_path unless session[:person_id] && Person.find(session[:person_id])
    end

end
