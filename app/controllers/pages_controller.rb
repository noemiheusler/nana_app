class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:intro, :discover]

  def profile
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

  def intro
  end

  def onboarding
  end

  def discover
  end

end
