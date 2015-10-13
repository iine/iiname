class PrefecturesController < ApplicationController
  before_action :set_prefecture, only: [:show, :edit, :update, :destroy]

  # GET /prefectures
  # GET /prefectures.json
  def index
    @prefectures = Prefecture.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prefecture
      @prefecture = Prefecture.find(params[:id])
    end

end
