class PeopleController < ApplicationController
  before_filter :authenticate, except: [:new, :create]

  before_filter :load_person, only: [:edit, :update, :destroy, :show]

  def index
    @people = Person.all.paginate(page: params[:page])
  end

  def new
    @person = Person.new
  end

  def create
    @person = Person.new(person_params)

    if @person.save
      redirect_to @person
    else
      redirect_to new_person_path
    end
  end

  def show
    @current_user = current_user
  end

  def edit
  end

  def update
    if @person.update(person_params)
      redirect_to @person
    else
      redirect_to edit_person_path(@person)
    end
  end

  def destroy
    @person.destroy
    redirect_to login_path
  end

  private
    def person_params
      params.require(:person).permit([:name, :email, :password, :password_confirmation])
    end

    def load_person
      @person = Person.find(params[:id])
    end

end
