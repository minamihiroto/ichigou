class RecruitsController < ApplicationController
  def new      
    @recruit = Recruit.new
  end
end
