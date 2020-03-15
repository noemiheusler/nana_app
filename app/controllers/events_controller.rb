class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = policy_scope(Event).order(created_at: :desc)

    #@events_organizer = Event.where(user_id: current_user.id)

    #@events_non_organizer = Event.where.not(user_id: current_user.id)
    #@events_participater = @events_non_organizer.joins(:participations).where("participations.user_id = #{current_user.id}")

    #@events_organizer_orparticipating = @events_organizer.where(@events_participater)

    #@events_invited = @events_non_organizer.joins(:invitations).where("invitations.user_id = #{current_user.id}")
    #@events = @events_organizer_orparticipating.where(@events_invited)

    #@events if params[:myevents].present?
    if params[:all].present?
      @events
    end

    if params[:organizing].present?
    @events = Event.where(user_id: current_user.id)
    end

    if params[:participating].present?
      @events_non_organizer = Event.where.not(user_id: current_user.id)
      @events = @events_non_organizer.joins(:participations).where("participations.user_id = #{current_user.id}")
    end

    if params[:invited].present?
      @events_non_organizer = Event.where.not(user_id: current_user.id)
      @events = @events_non_organizer.joins(:invitations).where("invitations.user_id = #{current_user.id}")
    end

    if params[:public].present?
      @events = Event.where(category: "Public")
      #@events = @events_public.where.not(user_id: current_user.id)
      #_public_notorga
      #@events_public_notorga_notparticipating = @events_public_notorga.joins(:participations).where.not("participations.user_id = #{current_user.id}")
      #@events = @events_public_notorga_notparticipating.joins(:invitations).where.not("invitations.user_id = #{current_user.id}")
    end
  end

  def new
    @event = Event.new
    authorize @event
  end

  def show
    authorize @event
    @markers =
      [{
        lat: @event.latitude,
        lng: @event.longitude,
      }]
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user

    authorize @event

    if @event.save
      user_ids = params[:event][:invitations]
      user_ids.each do |id|
        @invitation = Invitation.new
        @invitation.user_id = id
        @invitation.event_id = @event.id
        @invitation.save
      end
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
    params.require(:event).permit(:title, :description, :max_participants, :start_date, :end_date, :category, :location)
  end

  def set_event
    @event = Event.find(params[:id])
  end

end
