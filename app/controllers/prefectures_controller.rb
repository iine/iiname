# coding: utf-8
class PrefecturesController < ApplicationController
  before_action :set_prefecture, only: []

  # GET /prefectures
  # GET /prefectures.json
  def index
    @prefectures = Prefecture.all
  end




  def suggestion
    if params["id"].present?
      hokkaido = ["夕張メロン","白い恋人"]
      tokyo = ["東京タワー","東京バナナ"]
      other = ["その他","北海道と東京以外です"]

      case params["id"]
      when "1"
        keyword = hokkaido.sample
      when "13"
        keyword = tokyo.sample
      else
        keyword = other.sample
      end
    end
   puts params["id"]

      render json: {keyword: keyword}
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prefecture
      params.require(:id, :name)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def prefecture_params
      params.require(:id)
    end

end
