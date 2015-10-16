class SuggestionsController < ApplicationController
  #before_action :set_suggestion, only: [:show, :edit, :update, :destroy]

  # GET /suggestions
  # GET /suggestions.json
  def index
    @suggestions = Suggestion.all
  end

  # GET /suggestions/1
  # GET /suggestions/1.json
  def show
    if params["interests"].present?
      # ここに、興味の画像が選択された時の処理を書く
      # params["interests"]に配列で選択した画像の値(現状では"left", "right"のどちらか)が入っているので適当に使う
      left = ["Udon", "Sanuki", "Kitsune"]
      right = ["Soba", "Wanko", "Tanuki"]
      noodles = ["Noodles", "Japanese food", "Kakiage"]

      params["interests"]
      case params["interests"].last
      when "left"
        keyword = left.sample
      when "right"
        keyword = right.sample
      else
        keyword = noodles.sample
      end
      # あとで使う keyword = "test#{Random.rand}"
      render json: {keyword: keyword} and return
    end
    unless @suggestion.present?
      index = Random.rand(0..Suggestion.all.length - 1)
      @suggestion = Suggestion.all[index]
    end
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
