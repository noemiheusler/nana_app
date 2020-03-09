class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = policy_scope(Event).order(created_at: :desc)
  end

  def new
    @event = Event.new
    authorize @event
  end

  def show
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    authorize @event
    if @event.save
      redirect_to events_path, notice: 'Event was successfully created.'
    else
      render :new
    end
  end

  def destroy
    authorize @event
    @event.destroy
    redirect_to events_path, notice: 'Event was successfully deleted.'
  end

  def edit
    authorize @event
  end

  def update
    authorize @event
    if @event.update_attributes(event_params)
      redirect_to action: :index
      flash[:notice] = "Event was updated."
    else
      render "edit"
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :max_participants, :start_date, :end_date, :category)
  end

  def set_event
    @event = Event.find(params[:id])
  end

end
