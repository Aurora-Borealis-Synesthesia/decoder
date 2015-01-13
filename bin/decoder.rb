#!/usr/bin/env ruby

# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

require 'opencv'

require_relative '../lib/decoder.rb'

abort "Usage: #{__FILE__} path/to/video" if ARGV.empty?

video_file = ARGV.first
begin
  stream = OpenCV::CvCapture.open video_file
rescue
  abort "Can't find or read '#{video_file}'!"
end

puts "There are #{stream.frame_count} frames in #{video_file}"

# This has side effects. It advances the current position by a frame.
frame = stream.query

puts "The resolution of #{video_file} is #{frame.width}x#{frame.height}"

p pluck_pixels(frame).map { |e| e.to_a }
