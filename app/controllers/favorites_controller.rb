class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  def create
    user = User.find(params[:micropost_id])
    current_user.favorite(user)
    flash[:success] = 'お気に入りに登録しました。'
    redirect_back(fallback_location: root_url)
  end

  def destroy
    user = User.find(params[:micropost_id])
    current_user.unfavorite(user)
    flash[:success] = 'お気に入りを解除しました。'
     redirect_back(fallback_location: root_url)
  end
end
