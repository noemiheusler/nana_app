class InvitationsController < ApplicationController

  def create
    @participation = Participation.new()
    authorize @participation
    @participation.save
  end

  def destroy
    @invitation = Invitation.find(params[:id])
    authorize @invitation
    @invitation.destroy
    redirect_to events_path
  end
end
