module ApplicationHelper
  def current_user
    Person.find(session[:person_id]) if session[:person_id]
  end
end
