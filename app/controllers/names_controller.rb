# -*- coding: utf-8 -*-
require 'rakuten_web_service'
#require 'google_search'

class NamesController < ApplicationController
  #before_action :set_suggestion, only: [:show, :edit, :update, :destroy]

  # GET /suggestion
  # GET /suggestion.json
  def suggestion
    #render json: {keyword: suggestion_params.join("")}
    #str = "HaHaHa"
    str = suggenstion_by_rakuten(suggestion_params.join(" "))
    render json: {keyword: str}
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def suggestion_params
      params.require(:names)
    end
    
    # get names through web api
    def suggenstion_by_rakuten(keyword) 
      puts("start suggenstion_by_rakuten(" << keyword << ")");

      RakutenWebService.configuration do |c|
        c.application_id = ENV["APPID"]
        c.affiliate_id = ENV["AFID"]
      end

      #items = RakutenWebService::Ichiba::Item.ranking(:age => 30, :sex => 0)
      #items = RakutenWebService::Books::CD.search(:title => keyword)
      #items = RakutenWebService::Books::CD.search(:artistName => keyword)
      items = RakutenWebService::Books::Book.search(:author => keyword)
      #items = RakutenWebService::Books::Book.search(:title => keyword)

      #items.each_with_index do |item, i| puts "#{i}. #{item}" end

      team_name = "No item";

      puts("rakuten_web_service hit #{items.count} items.");
      if (items.count != 0) then
        candidate = items.first(1)[0]
        #puts "#{candidate.author} : #{candidate.title}"
        puts candidate
        team_name = candidate.title        

        # items.first(1).each do |item|
        #   puts "#{item.author} : #{item.title}"
        #   team_name << item.title
        # end
      else
        # google search
          
        Google::Search::Book.new(:query => keyword).first(1).each do |item|
          puts "#{item.title} by #{item.author} - #{item.index}"
          team_name = item.title
        end
          
        # g_items = Google::Search::Book.new(:query => keyword)
        # puts("google search hit #{g_items.count} items.");

        # g_candidate = g_items.first(1)[0]
        #puts "#{g_candidate.author} : #{g_candidate.title}"
        #puts g_candidate
        #team_name = g_candidate.title
      end

      return team_name
    end
end
