# -*- coding: utf-8 -*-
require 'rakuten_web_service'

class NamesController < ApplicationController
  #before_action :set_suggestion, only: [:show, :edit, :update, :destroy]

  # GET /suggestion
  # GET /suggestion.json
  def suggestion
    #render json: {keyword: suggestion_params.join("")}

    #str = Iiname::Engine.new(params).fetch(mode: "Book", suggestion_params.join(" "))
    #str = Iiname::Engine.new.search_by_webapi(suggestion_params.join(" "))
    #str = Iiname::Engine.new(:keyword => suggestion_params.join(" ")).fetch(mode: "Book")
    str = Iiname::Engine.new(:keyword => suggestion_params.join(" "), mode: :book).fetch.first
    render json: {keyword: str}
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def suggestion_params
      params.require(:names)
    end
end
