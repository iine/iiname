class SuggestionsController < ApplicationController
  #before_action :set_suggestion, only: [:show, :edit, :update, :destroy]

  # GET /suggestions
  # GET /suggestions.json
  def index
    @suggestions = Suggestion.all
    @list = find_list
  end

  # GET /suggestions/1
  # GET /suggestions/1.json
  def show
	index = Random.rand(0..Suggestion.all.length - 1)
	@suggestion = Suggestion.all[index]
  @list = find_list
#  @list.add_suggestion(@suggestion)
  end

  def find_list
    session[:list] ||= List.new
  end

  private
    # # Use callbacks to share common setup or constraints between actions.
    # def set_suggestion
    #   @suggestion = Suggestion.find(params[:id])
    # end
    #
    # # Never trust parameters from the scary internet, only allow the white list through.
    # def suggestion_params
    #   params.require(:suggestion).permit(:keyword)
    # end
end
