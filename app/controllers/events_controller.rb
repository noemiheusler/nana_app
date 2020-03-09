class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :edit, :update, :new, :show, :creat, :destroy]

  def index
    @events = Event.all
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
