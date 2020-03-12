class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:intro, :discover]

  def profile
  end

  def your_profile
    @user = User.find(params[:id])
  end

  def mynanas
    @users = User.all
    @friends = current_user.friends
    @friends_requested = current_user.requested_friends
  end

  def accept_friend
    current_user.accept_request(User.find(params[:id]))
    redirect_to mynanas_path
  end

  def reject_friend
    current_user.decline_request(User.find(params[:id]))
    redirect_to mynanas_path
  end

  def unfriend
    current_user.remove_friend(User.find(params[:id]))
  end

  def request_friend

  end

  def nana_friend
    @favorite = Favorite.new
    @favorite.user = current_user
    @favorite.nana = User.find(params[:id].to_i)
    if @favorite.save
     respond_to do |format|
        format.html { redirect_to mynanas_path }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    end
  end

  def nana_unfriend
    @favorite = Favorite.find_by(nana_id: params[:id])
    @favorite.destroy
    respond_to do |format|
        format.html { redirect_to mynanas_path }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
    end

  end

  def intro
  end

  def onboarding
  end

  def discover
  end

  def show_nanas_nearby
    @users_nearby = User.near(current_user.address, 10).sample(5)
    respond_to do |format|
        format.js  # <-- will render `app/views/reviews/create.js.erb`
    end
  end


end
