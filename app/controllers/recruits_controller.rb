class RecruitsController < ApplicationController

  before_action :authenticate_consumer,{only:[:new, :show, :edit, :update,:create,:destroy]}
  before_action :ensure_correct_organizer,{only:[:edit, :update,:destroy]}
  
  def index
    if params[:title].present?
      @recruits = Recruit.where('title LIKE ?', "%#{params[:title]}%").paginate(page: params[:page], per_page: 5).order(created_at: :desc).where(status: false)
    else
      @recruits = Recruit.paginate(page: params[:page], per_page: 5).order(created_at: :desc).where(status: false)
    end
  end
  
  def show
    @recruit = Recruit.find_by(id: params[:id])
    @organizer = @recruit.organizer
    @participants_ids = Application.where(recruits_id: params[:id]).pluck(:participants_id)
    @applications = Participant.where(id: @participants_ids)
    if session[:organizer_id] == nil && @recruit.status == true
      redirect_to("/login")
    elsif session[:organizer_id] != @organizer.id && @recruit.status == true
      redirect_to("/#{@current_organizer.id}")
    end
  end

  def new      
    @recruit = Recruit.new
  end

  def create
    @recruit = Recruit.new(image: params[:image],title: params[:title],text: params[:text],place: params[:place],capacity: params[:capacity],genre: params[:genre],guidelines: params[:guidelines],award: params[:award],price: params[:price],judging: params[:judging],schedule: params[:schedule],facility: params[:facility],backstage: params[:backstage],url: params[:url],organization: params[:organization],prefectures: params[:prefectures],organizer_id: @current_organizer.id)
    if @recruit.save && params[:draft_button]
      flash[:notice] = "ライブ募集の下書きがされました"
      redirect_to recruits_path
      @recruit.status = 1
      @recruit.save
    elsif @recruit.save
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
    params.require(:recruit).permit(:title,:text,:place,:image,:image_cache,:remove_image,:capacity,:genre,:guidelines,:award,:price,:judging,:schedule,:facility,:backstage,:url,:organization,:prefectures)
  end
end
