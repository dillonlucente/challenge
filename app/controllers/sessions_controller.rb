class SessionsController < ApplicationController
  def new

  end

  def create
    @person = Person.find_by(email: sessions_params[:email]).try(:authenticate, sessions_params[:password])

    if @person
      session[:person_id] = @person.id
      redirect_to @person
    else
      flash[:login] = "Sorry, the email or password isn't recognized"
      redirect_to login_path
    end
  end

  def destroy
    session.clear
    redirect_to login_path
  end

  private
    def sessions_params
      params.require(:session).permit(:email, :password)
    end

end
