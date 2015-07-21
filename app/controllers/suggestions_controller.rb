class SuggestionsController < ApplicationController
  before_action :fetch_all_suggestions, only: [:index, :show, :update]
  before_action :fetch_suggestion, only: [:destroy, :update]
  def index
    if !current_user
      redirect_to new_session_path

    end
  end

  def destroy
    @suggestion.destroy
    redirect_to suggestions_path
  end

  def create
    @new_suggestion = Suggestion.new(suggestion_params)
    @new_suggestion.user_id = current_user.id

    if @new_suggestion.save

      redirect_to suggestions_path
    else

      redirect_to new_session_path
    end
  end

  def update
    @suggestion.update(suggestion_params)
    redirect_to suggestions_path
  end

  private

  def fetch_suggestion
    @suggestion = Suggestion.find(params[:id])
  end

  def fetch_all_suggestions
    @all_suggestions = Suggestion.all
  end


  def suggestion_params
    params.require(:suggestion).permit(:title, :content)
  end

end
