class RecruitsController < ApplicationController

  def index
    @recruits = Recruit.all.order(created_at: :desc)
  end
  
  def show
    @recruit = Recruit.find_by(id: params[:id])
  end

  def new      
    @recruit = Recruit.new
  end

  def creates
    @recruit = Recruit.new(title: params[:title])

    @recruit.save

    redirect_to("/recruits/index")
  end

end
