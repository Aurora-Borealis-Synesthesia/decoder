#!/usr/bin/env ruby

require 'opencv'
include OpenCV

abort "Usage: #{__FILE__} path/to/video" if ARGV.empty?

video_file = ARGV.first
begin
  stream = CvCapture.open video_file
rescue
  abort "Can't find or read '#{video_file}'!"
end

puts "There are #{stream.frame_count} frames in '#{video_file}'"
