# frozen_string_literal: true

class GamesController < ApplicationController

  def index
    @q = Game.ransack(params[:q])
    @pagy, @games = pagy(@q.result, items: 9)  
  end
end
