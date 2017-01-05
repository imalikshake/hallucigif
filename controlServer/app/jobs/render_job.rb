class RenderJob < ProgressJob::Base

attr_accessor :url, :start, :duration

def initialize(url, start, duration)
  @url = url.to_s
  @start = start.to_s
  @duration = duration.to_s
  puts "initialised " + self.url
end

def perform
  update_stage('Exporting users')    
  update_progress_max(10)
  #`cd /home/ubuntu/; ./processvid.sh "https://www.youtube.com/watch?v=zO_1f_olvCQ" "00:30:30" "00:00:05" 10`
  #`cd /home/ubuntu/; ./processvid.sh #{self.url}  #{self.start} #{self.duration} #{self.id}`
  puts self.url
  puts %x(cd /home/ubuntu/; echo #{@url}  #{@start} #{@duration} 0)
  update_progress(step: 10)
  #(1..10).each do |i|
  #  update_progress(step: 1)
  #  sleep(1)
  #end
end

end
