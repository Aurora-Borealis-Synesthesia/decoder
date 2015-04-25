# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

require 'opencv'
require 'json'

class Video
  def initialize(path, sampler = RandomSampler)
    @stream = OpenCV::CvCapture.open path
    @sampler = sampler
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
      samples_arr << @sampler.new(frame, 10).sample
      frame = @stream.query
    end
    samples_arr
  end
end


class RandomSampler
  attr_reader :num_samples

  def initialize(frame, num_samples)
    @frame = frame
    @num_samples = num_samples
  end

  def sample
    frame_size = @frame.size
    random_indexes = Array.new(num_samples) do
      Random.rand(frame_size.height * frame_size.width)
    end
    random_indexes.map { |i| @frame[i].to_a }
  end
end
