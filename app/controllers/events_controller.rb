class EventsController < ApplicationController

  def index
    @events = Event.all
    @events = policy_scope(Event).order(created_at: :desc)
  end

  def new
    @event = Event.new
    #authorize @event
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
