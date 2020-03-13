class FavoritesController < ApplicationController

  def new
    @favorite = Favorite.new
    authorize @favorite
  end

  def create
    @favorite = Favorite.new
    @favorite.user_id = current_user.id
    @favorite.nana_id = params[:id]
  end

  def destroy
  end

end
