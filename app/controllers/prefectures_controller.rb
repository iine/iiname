class PrefecturesController < ApplicationController
  before_action :set_prefecture, only: []

  # GET /prefectures
  # GET /prefectures.json
  def index
    @prefectures = Prefecture.all
  end

  def suggestion
    # ここに何かしらロジックを書く
    @prefecture = Prefecture.find(prefecture_params)
    render json: {keyword: "#{@prefecture.prefecture} - #{Random.rand}"}
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prefecture
      params.require(:id, :name)
      # render json: prefecture.prefecture_id.select(:id, :name)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def prefecture_params
      params.require(:id)
    end
end
