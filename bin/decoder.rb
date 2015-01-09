#!/usr/bin/env ruby

require 'opencv'
include OpenCV

abort "Usage: #{__FILE__} path/to/video" if ARGV.empty?

begin
  video_stream = CvCapture.open ARGV.first
rescue
  abort "Can't find or read '#{video_file}'!"
end

puts "There are #{video_stream.frame_count} frames in '#{video_file}'"
