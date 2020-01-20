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
      redirect_to recruits_path
    else
      redirect_to new_recruit_path
    end
  end

  def edit
    @recruit = Recruit.find_by(id: params[:id])
  end
  
  def update
    @recruit = Recruit.find_by(id: params[:id])
    @recruit.title = params[:title]
    @recruit.text = params[:text]
    @recruit.place = params[:place]
    if @recruit.save
      redirect_to recruits_path
    else
      redirect_to edit_recruit_path
    end
  end

  def destroy
    @recruit = Recruit.find_by(id: params[:id])
    @recruit.destroy
    redirect_to recruits_path
  end

end
