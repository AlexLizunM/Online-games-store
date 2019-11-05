# frozen_string_literal: true

class GamesController < ApplicationController
  ITEMS_PER_PAGE = 12
  COMMENTS_PER_PAGE = 10

  def index
    @q = Game.ransack(params[:q])
    @pagy, @games = pagy(@q.result, items: ITEMS_PER_PAGE)
  end

  def show
    @game = Game.includes(:comments, :users).find(params[:id])
    @q = @game.comments.ransack(params[:q])
    @pagy, @comments = pagy(@q.result, items: COMMENTS_PER_PAGE)
  end
end
