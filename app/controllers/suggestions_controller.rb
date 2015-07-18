class SuggestionsController < ApplicationController
  before_action :fetch_all_suggestions, only: [:index, :show, :update]

  def index
    if @all_suggestions == nil || @all_suggestions
      render 'index'
    end
  end

  def create
    @new_suggestion = Suggestion.new(suggestion_params)

    if @new_suggestion.save

      redirect_to suggestions_path
    else

      redirect_to new_user_path
    end
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
