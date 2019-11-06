# frozen_string_literal: true

class CommentsController < ProfileLayoutController
  before_action :find_user
  COMMENTS_PER_PAGE = 10

  def index
    @q = @user.comments.ransack(params[:q])
    @pagy, @comments = pagy(@q.result, items: COMMENTS_PER_PAGE)
  end

  def create
    @comment = Comment.new(comment_params)
    flash[:error] = "#{@comment.errors.full_messages.first}" unless @comment.save
    redirect_to game_path(comment_params[:game_id]) 
  end

  def update
    @comment = @user.comments.find_by(game_id: comment_params[:game_id])
    if @comment.update(comment_params)
      redirect_to game_path(comment_params[:game_id])
    else
      redirect_to game_path(comment_params[:game_id])
    end
  end

  def destroy
    @comment = @user.comments.find_by(game_id: comment_params[:game_id])
    @comment.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def find_user
    @user = User.find(params[:user_id])
  end

  def comment_params
    params.require(:comment).permit([:rating, :content, :user_id, :game_id])
  end
end
