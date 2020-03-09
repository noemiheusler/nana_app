class EventsController < ApplicationController
  authorize @event

  def index
    @events = policy_scope(Event).order(created_at: :desc)
  end

  def new
  end

  def show
  end

  def create
  end

  def destroy
  end

  def edit
  end

  def update
  end
end
