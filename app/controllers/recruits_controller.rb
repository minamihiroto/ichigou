class RecruitsController < ApplicationController

  def index
    @recruits = Recruit.order(created_at: :desc)
  end
  
  def show
    @recruit = Recruit.find_by(id: params[:id])
  end

  def new      
    @recruit = Recruit.new
  end

  def create
    @recruit = Recruit.new(title: params[:title],text: params[:text],place: params[:place])
    if @recruit.save
      flash[:notice] = "ライブ募集が投稿されました"
      redirect_to recruits_path
    else
      flash[:notice] = "ライブ募集の投稿に失敗しました"
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
      flash[:notice] = "ライブ募集の編集に失敗しました"
      redirect_to edit_recruit_path
    end
  end

  def destroy
    @recruit = Recruit.find_by(id: params[:id])
    @recruit.destroy
    flash[:notice] = "ライブ募集が削除されました"
    redirect_to recruits_path
  end

end
