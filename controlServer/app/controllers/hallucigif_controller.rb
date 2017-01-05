class HallucigifController < ApplicationController
  def index
  end

  def show
  end

  def render_gif
    puts "ayyyyyyy" + @url.to_s
    @job = Delayed::Job.enqueue RenderJob.new(url: @url, start: @start, duration: @duration)
  end
  
  def submit
    @ytlink = params[:link]
    @minute = params[:video_start]["from_time(5i)"]
    @second = params[:video_start]["from_time(6i)"]
    @gif_duration  = params[:duration]["duration_id"]
    @time = "00:" + @minute + ":" + @second
    @url = @ytlink
    @start = @time
    @duration = "00:00:0" + @gif_duration
    
    puts "ayye" + @url

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
