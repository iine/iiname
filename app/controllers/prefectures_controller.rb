# coding: utf-8
class PrefecturesController < ApplicationController
  before_action :set_prefecture, only: []

  # GET /prefectures
  # GET /prefectures.json
  def index
    @prefectures = Prefecture.all
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
