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
      redirect_to('/recruits')
    else
      redirect_to('/recruits/new')
    end
  end

end
