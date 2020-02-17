class OrganizersController < ApplicationController

  before_action :authenticate_consumer,{only:[:index, :show, :edit, :update]}
  before_action :forbid_login_organizer,{only:[:new, :create, :login_form, :login]}
  before_action :ensure_correct_organizer,{only: [:edit, :update]}

  def index
    @organizers = Organizer.order(created_at: :desc)
  end

  def show
    @organizer = Organizer.find_by(id: params[:id])
  end

  def new
    @organizer = Organizer.new
  end

  def create
    @organizer = Organizer.new(image: params[:image],name: params[:name],email: params[:email],password: params[:password])
    if @organizer.save
      session[:organizer_id] = @organizer.id
      flash[:notice] = "登録されました"
      redirect_to recruits_path
    else
      render 'new'
    end
  end

  def edit
    @organizer = Organizer.find_by(id: params[:id])
  end
    
  def update
    @organizer = Organizer.find_by(id: params[:id])
    if @organizer.update(organizer_params)
      flash[:notice] = "プロフィールが編集されました"
      redirect_to organizer_path
    else
      render 'edit'
    end
  end

  def destroy
    @organizer = Organizer.find_by(id: params[:id])
    @organizer.destroy
    flash[:notice] = "登録情報が削除されました"
    redirect_to new_organizer_path
  end

  def login_form
  end

  def login
   @organizer = Organizer.find_by(email: params[:email])
    if @organizer && @organizer.authenticate(params[:password])
      session[:organizer_id] = @organizer.id
      flash[:notice] = "ログインしました"
      redirect_to recruits_path
   else
    flash[:notice] = "メールアドレスかパスワードが間違っています"
    redirect_to organizers_login_path
    end
  end

  def logout
    session[:organizer_id] = nil
    flash[:notice] ="ログアウトしました"
    redirect_to organizers_login_path
  end

  def ensure_correct_organizer            
    if @current_organizer.id != params[:id].to_i            
      flash[:notice] = "権限がありません"            
      redirect_to recruits_path
    end
  end

  def organizer_params
    params.require(:organizer).permit(:name,:email,:introduction,:image)
  end
end
