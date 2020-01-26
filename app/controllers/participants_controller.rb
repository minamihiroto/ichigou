class ParticipantsController < ApplicationController

  before_action :authenticate_participant,{only:[:index, :show, :edit, :update]}
  before_action :forbid_login_participant,{only:[:new, :create, :login_form, :login]}
  before_action :ensure_correct_participant,{only: [:edit, :update]}

  def show
    @participant = Participant.find_by(id: params[:id])
  end

  def new
    @participant = Participant.new
  end

  def create
    @participant = Participant.new(name: params[:name],email: params[:email],password: params[:password])
    if @participant.save
      session[:participant_id] = @participant.id
      flash[:notice] = "登録されました"
      redirect_to recruits_path
    else
      flash[:notice] = "名前とメールアドレスを記載してください"
      redirect_to new_participant_path
    end
  end

  def edit
    @participant = Participant.find_by(id: params[:id])
  end
    
  def update
    @participant = Participant.find_by(id: params[:id])
    if @participant.update(name: params[:name],email: params[:email],introduction: params[:introduction])
      flash[:notice] = "プロフィールが編集されました"
      redirect_to participant_path
    else
      flash[:notice] = "名前とメールアドレス、自己紹介文を記載してください"
      redirect_to edit_participant_path
    end
  end

  def destroy
    @participant = Participant.find_by(id: params[:id])
    @participant.destroy
    flash[:notice] = "登録情報が削除されました"
    redirect_to new_participant_path
  end

  def login_form
  end

  def login
   @participant = Participant.find_by(email: params[:email])
    if @participant && @participant.authenticate(params[:password])
      session[:participant_id] = @participant.id
      flash[:notice] = "ログインしました"
      redirect_to recruits_path
   else
      flash[:notice] = "メールアドレスかパスワードが間違っています"
      redirect_to participants_login_path
    end
  end

  def logout
    session[:participant_id] = nil
    flash[:notice] ="ログアウトしました"
    redirect_to participants_login_path
  end

  def ensure_correct_participant           
    if @current_participant.id != params[:id].to_i            
      flash[:notice] = "権限がありません"            
      redirect_to recruits_path
    end
  end

end
