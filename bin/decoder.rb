#!/usr/bin/env ruby

require 'opencv'
include OpenCV

if ARGV.size == 0
  puts "Usage: #{__FILE__} path/to/video"
  exit
end

video_file = ARGV.first

begin
  CvCapture.open video_file
rescue
  abort "Can't find or read '#{video_file}'!"
end

puts 'Hello, mum!'
