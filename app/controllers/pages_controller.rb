class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def profile
  end

  def mynanas
  end

  def intro
  end

  def onboarding
  end

  def discover
  end

end
