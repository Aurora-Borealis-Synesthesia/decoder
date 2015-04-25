# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

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
