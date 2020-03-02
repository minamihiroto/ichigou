class ApplicationController < ActionController::Base

  before_action :set_current_organizer
  before_action :set_current_participant

  def set_current_organizer
    @current_organizer = Organizer.find_by(id: session[:organizer_id])
  end

  def set_current_participant
    @current_participant = Participant.find_by(id: session[:participant_id])
  end

  def authenticate_consumer
    unless @current_organizer != nil || @current_participant != nil
     flash[:notice] = "ログインが必要です"
     redirect_to organizers_login_path
    end
  end

  def forbid_login_organizer
    if @current_organizer
      flash[:notice] = "すでにログインしています"
      redirect_to recruits_path
    end
  end

  def forbid_login_participant
    if @current_participant
      flash[:notice] = "すでにログインしています"
      redirect_to recruits_path
    end
  end

end
