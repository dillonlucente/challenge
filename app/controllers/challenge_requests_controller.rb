class ChallengeRequestsController < ApplicationController
  before_filter :authenticate

  before_filter :load_challenge_request, only: [:edit, :update, :destroy, :show]

  def new
    @challenge_request = ChallengeRequest.new
    @challenge_request.person = current_user
    @challenge_request.assignee = Person.find(params[:person_id]) if params[:person_id]
  end

  def create
    @challenge_request = ChallengeRequest.new(challenge_request_params)
    @challenge_request.person = current_user

    if @challenge_request.save
      current_user.update_attributes({ tokens: (current_user.tokens - 1) < 0 ? 0 : (current_user.tokens - 1) })
      redirect_to @challenge_request.assignee
    else
      redirect_to @challenge_request.assignee
    end
  end

  def update
    if params[:challenge_request][:complete] == "1"
      @challenge_request.assignee.update_attributes({tokens: (@challenge_request.assignee.tokens += 1)})
    else params[:challenge_request][:complete] == "0"
      @challenge_request.assignee.update_attributes({tokens: (@challenge_request.assignee.tokens -= 1)})
    end
    @challenge_request.update(challenge_request_params)

    redirect_to @challenge_request
  end

  def destroy
    @challenge_request.destroy
    redirect_to current_user
  end

  private
    def challenge_request_params
      params.require(:challenge_request).permit([:text, :assignee_id, :complete])
    end

    def load_challenge_request
      @challenge_request = ChallengeRequest.find(params[:id])
    end

end
