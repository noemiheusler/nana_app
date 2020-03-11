class ParticipationsController < ApplicationController

  def new
    @parcicipation = Participation.new
    authorize @participation
  end

  def create
    @participation = Participation.new()
    @participation.event_id = params[:event_id]
    @participation.user_id = current_user.id
    authorize @participation

    invitation_record = Invitation.where(user_id: "#{current_user.id}", event_id: "#{params[:event_id]}")

    if invitation_record.present?

      invitation_id = invitation_record.first.id
      @invitation = Invitation.find(invitation_id)

      authorize @invitation
      @invitation.destroy

    end

    @participation.save
    redirect_to events_path
  end

  def destroy
    @participation = Participation.find(params[:id])
    authorize @participation
    @participation.destroy
    redirect_to events_path
  end
end
