class NamesController < ApplicationController
  #before_action :set_suggestion, only: [:show, :edit, :update, :destroy]

  # GET /suggestion
  # GET /suggestion.json
  def suggestion
    render json: {keyword: suggestion_params.join("")}
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def suggestion_params
      params.require(:names)
    end
end
