class HallucigifController < ApplicationController
  
  def show
  end

  def submit
    @ytlink = params[:link]

    job = Hallucigif.new 
    job.link = @ytlink
    job.valid?
    if job.valid? != true
        flash[:message] = "Empty link!" 
        redirect_to '/'
    end
    job.save
  end
end
