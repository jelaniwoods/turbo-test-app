class LogsController < ApplicationController
  include ActionController::Live

  def show
    # response.headers["Content-Type"] = "text/event-stream"
    # puts "--->"
    # p Rails.root.join("log", "#{Rails.env}.log")
    # puts "---"
    
    # File.open(Rails.root.join("log", "#{Rails.env}.log"), "r") do |file|
    #   file.seek(0, IO::SEEK_END) # start reading from the end of the file
    #   loop do
    #     changes = file.read
    #     unless changes.empty?
    #       response.stream.write("data: #{changes}\n\n")
    #     end
    #     sleep 1
    #   end
    # end
    # rescue IOError
    #   # Handle stream closed
    # ensure
    #   response.stream.close
    # end
  end
end
