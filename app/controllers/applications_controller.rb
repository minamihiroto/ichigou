class ApplicationsController < ApplicationController
  before_action :authenticate_consumer
  def create
     @application = Application.new(participants_id: @current_participant.id, recruits_id: params[:recruit_id])
     @application.save
     redirect_to("/recruits/#{params[:recruit_id]}")
  end

  def destroy
    @application = Application.find_by(participants_id: @current_participant.id, recruits_id: params[:recruit_id])
    @application.destroy
    redirect_to("/recruits/#{params[:recruit_id]}")
  end
end
