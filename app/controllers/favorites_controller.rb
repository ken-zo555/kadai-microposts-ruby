class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def index
    @user = current_user
    @favorites = @user.like_microposts.page(params[:page])
  end
  
  def create
    micropost = Micropost.find(params[:micropost_id])
    current_user.like(micropost)
    flash[:success] = 'コメントをお気に入りに追加しました'
    redirect_back(fallback_location: root_path)
  end

  def destroy
    micropost = Micropost.find(params[:micropost_id])
    current_user.unlike(micropost)
    flash[:danger] = 'コメントをお気に入りから削除しました'  
    redirect_back(fallback_location: root_path)
  end
end
