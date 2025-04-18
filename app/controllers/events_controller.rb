class EventsController < ApplicationController
  include ActionController::Live

  def index
    response.headers['Content-Type'] = 'text/event-stream'
    response.headers['Last-Modified'] = Time.now.httpdate
    
    sse = SSE.new(response.stream, event: "message")
    File.open(Rails.root.join("log", "#{Rails.env}.log"), "r") do |file|
    file.seek(0, IO::SEEK_END) # start reading from the end of the file
    prev =  `wc -l < #{file.path}`.to_i

    loop do
      number_of_lines =  `wc -l < #{file.path}`.to_i
        if prev < number_of_lines
          p diff = number_of_lines - prev
          content = `tail -n #{diff}  #{file.path}`
          sse.write(content)
          prev = number_of_lines
        end
        sleep 1
      end
    end

  ensure
    sse.close
  end
end
