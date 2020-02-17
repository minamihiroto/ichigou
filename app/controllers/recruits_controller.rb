class RecruitsController < ApplicationController

  before_action :authenticate_consumer,{only:[:new, :show, :edit, :update,:create,:destroy]}
  before_action :ensure_correct_organizer,{only:[:edit, :update,:destroy]}
  
  def index
    if params[:title].present?
      @recruits = Recruit.where('title LIKE ?', "%#{params[:title]}%")
    else
      @recruits = Recruit.all.order(created_at: :desc)
    end
  end
  
  def show
    @recruit = Recruit.find_by(id: params[:id])
    @organizer = @recruit.organizer
  end

  def new      
    @recruit = Recruit.new
  end

  def create
    @recruit = Recruit.new(image: params[:image],title: params[:title],text: params[:text],place: params[:place],organizer_id: @current_organizer.id)
    if @recruit.save
      flash[:notice] = "ライブ募集が投稿されました"
      redirect_to recruits_path
    else
      render 'new'
    end
  end

  def edit
    @recruit = Recruit.find_by(id: params[:id])
  end
  
  def update
    @recruit = Recruit.find_by(id: params[:id])
    if @recruit.update(recruit_params)
      flash[:notice] = "ライブ募集が編集されました"
      redirect_to recruits_path
    else
      render 'edit'
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

  def recruit_params
    params.require(:recruit).permit(:title,:text,:place,:image)
  end
end
