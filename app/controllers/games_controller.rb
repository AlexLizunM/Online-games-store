# frozen_string_literal: true

class GamesController < ApplicationController
  ITEMS_PER_PAGE = 12
  
  def index
    @q = Game.ransack(params[:q])
    @pagy, @games = pagy(@q.result, items: ITEMS_PER_PAGE)  
  end
end
