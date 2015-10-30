# -*- coding: utf-8 -*-
require 'rakuten_web_service'

class NamesController < ApplicationController
  #before_action :set_suggestion, only: [:show, :edit, :update, :destroy]

  # GET /suggestion
  # GET /suggestion.json
  def suggestion
    #render json: {keyword: suggestion_params.join("")}

    #str = Iiname::Engine.new(params).fetch(mode: "Books", suggestion_params.join(" "))
    str = Iiname::Engine.new.search_by_webapi(suggestion_params.join(" "))
    render json: {keyword: str}
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def suggestion_params
      params.require(:names)
    end
end
