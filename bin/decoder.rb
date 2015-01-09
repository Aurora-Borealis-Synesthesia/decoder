#!/usr/bin/env ruby

require 'opencv'
include OpenCV

if ARGV.size == 0
  puts "Usage: #{__FILE__} path/to/video"
  exit
end

video_file = ARGV.first

begin
  video_stream = CvCapture.open video_file
rescue
  abort "Can't find or read '#{video_file}'!"
end

puts "There are #{video_stream.frame_count} frames in '#{video_file}'"
