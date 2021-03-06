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
      keyword = params["interests"]
      #render json: {keyword: keyword} and return
      ignite_engine(keyword) and return
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

      #render json: {keyword: keyword} and return
      ignite_engine(keyword) and return
    end

    if params[:places].present? && params[:places].kind_of?(Array)
      ignite_engine(params[:places].join, true) and return
    end

    if params[:names].present? and params[:names].kind_of?(Array)
      origin_keyword = params[:names].join(" ")
      ignite_engine(params[:names].join, false, :book) and return
    end

    unless @suggestion.present?
      index = Random.rand(0..Suggestion.all.length - 1)
      origin_keyword = Suggestion.all[index].keyword

      ignite_engine(origin_keyword)
    end
  end

  def ignite_engine(origin_keyword, skip_search=false, m = :web)
    morph_target = origin_keyword
    searched_keyword = ""
    unless skip_search
      search_results = Iiname::Engine.new(keyword: origin_keyword, mode: m).fetch
      searched_keyword = search_results.sample.title.slice(0..19)
      morph_target = searched_keyword
    end
    nouns = MorphologicalAnalyser.new.extract_noun(morph_target)
    nouns = nouns.sample(Random.rand(1..3))
    puts("origin_keyword = #{origin_keyword}")
    puts("searched_keyword = #{searched_keyword}")
    puts("nouns = #{nouns}")
    render json: {keyword: nouns.shuffle.join, searched: searched_keyword, origin: origin_keyword}
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
