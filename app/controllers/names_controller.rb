# -*- coding: utf-8 -*-
require 'rakuten_web_service'

class NamesController < ApplicationController
  #before_action :set_suggestion, only: [:show, :edit, :update, :destroy]

  # GET /suggestion
  # GET /suggestion.json
  def suggestion
    #render json: {keyword: suggestion_params.join("")}
    str = suggestion_by_webapi(suggestion_params.join(" "))
    render json: {keyword: str}
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def suggestion_params
      params.require(:names)
    end
  
  public
    # get names through web api
    def suggestion_by_webapi(keyword) 
      puts("start suggestion_by_webapi(", keyword, ")");

      team_name = "No name"

      # get team name through rakuten api
      items = suggestion_by_rakuten(keyword)
      if (items.count != 0) then
        item = items.first
      else
        # get team name through google api
        item = suggestion_by_google(keyword).first
      end

      puts("class = ",item.class)
      puts("#{item.title} by #{item.author}")
      team_name = item.title
      return team_name
    end

    # rakten search
    def suggestion_by_rakuten(keyword)
      puts("start suggestion_by_rakuten(", keyword, ")");

      # configure environmental variables
      RakutenWebService.configuration do |c|
        c.application_id = ENV["APPID"]
        c.affiliate_id = ENV["AFID"]
      end

      #r_items = RakutenWebService::Ichiba::Item.ranking(:age => 30, :sex => 0)
      #r_items = RakutenWebService::Books::CD.search(:title => keyword)
      #r_items = RakutenWebService::Books::CD.search(:artistName => keyword)
      #r_items = RakutenWebService::Books::Book.search(:title => keyword)
      r_items = RakutenWebService::Books::Book.search(:author => keyword)

      items = r_items.to_a
      puts("rakuten_web_service hit #{items.count} items.")
      #items.each_with_index do |item, i| puts "#{i}: #{item.class} title=#{item.title}" end
      puts("return is #{items.class}")
      return items
    end

    # google search
    def suggestion_by_google(keyword)
      puts("start suggestion_by_google(" << keyword << ")");
      items = Google::Search::Book.new(:query => keyword).to_a
      puts("google_web_service hit #{items.count} items.");
      # items.each_with_index do |item, i| puts "#{i}: #{item.class} title=#{item.title}" end
      puts("return is #{items.class}")
      return items
    end
end
