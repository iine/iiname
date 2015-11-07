class SuggestionsController < ApplicationController
  #before_action :set_suggestion, only: [:show, :edit, :update, :destroy]

  # GET /suggestions
  # GET /suggestions.json
  def index
    @suggestions = Suggestion.all
    @prefectures = Prefecture.all
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

    if params["prefecture_id"].present?
      hokkaido = ["夕張メロン","白い恋人"]
      tokyo = ["東京タワー","東京バナナ"]
      other = ["その他","北海道と東京以外です"]

      case params["prefecture_id"]
      when "1"
        keyword = hokkaido.sample
      when "13"
        keyword = tokyo.sample
      else
        keyword = other.sample
      end

      render json: {keyword: keyword} and return
    end

    unless @suggestion.present?
      index = Random.rand(0..Suggestion.all.length - 1)
      search_results = Iiname::Engine.new(keyword: Suggestion.all[index].keyword).fetch
      t = search_results.sample.title
      puts("t = #{t}}")
      s = t.split( /[ ,:\-\|\.\(\)｜「」『』【】（）、。：？！]+/).sample[0, 20]
      puts("s = #{s}")
      render json: {keyword: s}
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
