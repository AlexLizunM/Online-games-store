class BucketItemsController < ProfileLayoutController
  before_action :find_user

  def index
    @bucket_items = @user.games
  end

  def create
    @bucket_item = BucketItem.new(bucket_item_params)
    flash[:error] = "#{@bucket_item.errors.full_messages.first}" unless @bucket_item.save
    redirect_to game_path(bucket_item_params[:game_id]) 
  end

  def destroy
    @bucket_item = @user.bucket_items.find_by(game_id: bucket_item_params[:game_id])
    @bucket_item.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def find_user
    @user = User.find(params[:user_id])
  end

  def bucket_item_params
  params.require(:bucket_item).permit([:user_id, :game_id])
  end
end
