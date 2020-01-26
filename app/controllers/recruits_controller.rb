class RecruitsController < ApplicationController

  before_action :authenticate_organizer,{only:[:new, :show, :edit, :update,:create,:destroy]}
  before_action :ensure_correct_organizer,{only:[:edit, :update,:destroy]}
  
  def index
    @recruits = Recruit.order(created_at: :desc)
  end
  
  def show
    @recruit = Recruit.find_by(id: params[:id])
    @organizer = @recruit.organizer
  end

  def new      
    @recruit = Recruit.new
  end

  def create
    @recruit = Recruit.new(title: params[:title],text: params[:text],place: params[:place],organizer_id: @current_organizer.id)
    if @recruit.save
      flash[:notice] = "ライブ募集が投稿されました"
      redirect_to recruits_path
    else
      flash[:notice] = "タイトルか本文、住所が記載されていません"
      redirect_to new_recruit_path
    end
  end

  def edit
    @recruit = Recruit.find_by(id: params[:id])
  end
  
  def update
    @recruit = Recruit.find_by(id: params[:id])
    if @recruit.update(title: params[:title],text: params[:text],place: params[:place])
      flash[:notice] = "ライブ募集が編集されました"
      redirect_to recruits_path
    else
      flash[:notice] = "タイトルか本文、住所が記載されていません"
      redirect_to edit_recruit_path
    end
  end

  def destroy
    @recruit = Recruit.find_by(id: params[:id])
    @recruit.destroy
    flash[:notice] = "ライブ募集が削除されました"
    redirect_to recruits_path
  end

  def ensure_correct_organizer
    @recruit = Recruit.find_by(id: params[:id])
    if @recruit.organizer_id != @current_organizer.id
    flash[:notice] = "権限がありません"
    redirect_to recruits_path
    end
  end
end
