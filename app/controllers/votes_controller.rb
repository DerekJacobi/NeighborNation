class VotesController < ApplicationController

  def vote_yes
    @new_vote = Vote.new(vote_params)

    @new_vote.approve = true
    @new_vote.suggestion_id = params[:id]
    @new_vote.user_id = current_user.id
    @new_vote.save
    redirect_to suggestions_path
  end

  def vote_no
    @new_vote = Vote.new(vote_params)

    @new_vote.approve = false
    @new_vote.suggestion_id = params[:id]
    @new_vote.user_id = current_user.id
    @new_vote.save
    redirect_to suggestions_path
  end

  private

  def vote_params
    params.permit(:user, :suggestion, :approve)
  end
end
