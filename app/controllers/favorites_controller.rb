class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  def create
    user = Micropost.find(params[:micropost_id])
    current_user.favorite(user)
    flash[:success] = 'お気に入りに登録しました。'
    redirect_back(fallback_location: root_url)
  end

  def destroy
    user = Micropost.find(params[:micropost_id])
    current_user.unfavorite(user)
    flash[:success] = 'お気に入りを解除しました。'
     redirect_back(fallback_location: root_url)
  end
end


  # def create
  #   user = User.find(params[:follow_id])
  #   current_user.follow(user)
  #   flash[:success] = 'ユーザをフォローしました。'
  #   redirect_to user
  # end

  # def destroy
  #   user = User.find(params[:follow_id])
  #   current_user.unfollow(user)
  #   flash[:success] = 'ユーザのフォローを解除しました。'
  #   redirect_to user
  # end


  # def create
  #   @micropost = current_user.microposts.build(micropost_params)
  #   if @micropost.save
  #     flash[:success] = 'メッセージを投稿しました。'
  #     redirect_to root_url
  #   else
  #     @microposts = current_user.feed_microposts.order('created_at DESC').page(params[:page])
  #     flash.now[:danger] = 'メッセージの投稿に失敗しました。'
  #     render 'toppages/index'
  #   end
  # end

  # def destroy
  #   @micropost.destroy
  #   flash[:success] = 'メッセージを削除しました。'
  #   redirect_back(fallback_location: root_path)
  # end