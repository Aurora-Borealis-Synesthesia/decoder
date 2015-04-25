# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

require 'opencv'
require 'json'

require_relative 'random_sampler'
require_relative 'grid_sampler'

class Video
  def initialize(path, sampler = GridSampler, sampler_args = [10, 10])
    @stream       = OpenCV::CvCapture.open path
    @sampler      = sampler
    @sampler_args = sampler_args
  end

  def samples
    @samples ||= sample!
  end

  def serialize
    samples.map(&:to_json).join("\n")
  end

  private

  def progress_indicator
    "#{@stream.frames.to_i} / #{@stream.frame_count.to_i}"
  end

  def sample!
    samples_arr = []
    frame = @stream.query
    while frame
      puts progress_indicator
      samples_arr << @sampler.new(frame, *@sampler_args).sample
      frame = @stream.query
    end
    samples_arr
  end
end
