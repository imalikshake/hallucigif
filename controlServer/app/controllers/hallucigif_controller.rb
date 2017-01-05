class HallucigifController < ApplicationController
  def index
  end

  def show
  end

  def render_gif
    @job = Delayed::Job.enqueue RenderJob.new
  end
  
  def submit
    @ytlink = params[:link]
    @minute = params[:video_start]["from_time(5i)"]
    @second = params[:video_start]["from_time(6i)"]
    @gif_duration  = params[:duration]["duration_id"]
    @time = "00:" + @minute + ":" + @second

    job = Hallucigif.new 
    job.link = @ytlink
    job.valid?
    if job.valid? != true
        flash[:message] = "Invalid link!" 
        redirect_to '/'
    end
    job.save
  end
end
