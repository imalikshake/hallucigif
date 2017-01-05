class RenderJob < ProgressJob::Base

def initialize
  puts "inside init"
end

def perform
  puts "inside job"
  update_stage('Exporting users')    
  update_progress_max(100)
  (1..100).each do |i|
    update_progress(step: 10)
    puts "inside loop"
  end
end

end