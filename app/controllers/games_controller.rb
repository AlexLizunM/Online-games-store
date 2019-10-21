# frozen_string_literal: true

class GamesController < ApplicationController

  def index
    if params[:search]
      @pagy, @games = pagy(Game.search(params[:search]), items: 9)
    else  
      @pagy, @games = pagy(Game.all, items: 9)
    end
  end
end
