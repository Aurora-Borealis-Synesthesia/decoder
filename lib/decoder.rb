# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

require 'opencv'

# Placeholder for now- uses random indexing.
def pluck_pixels(frame)
  frame_size = frame.size
  pixels_to_pick = 5

  random_indexes = Array.new(pixels_to_pick) do
    Random.rand(frame_size.height * frame_size.width)
  end

  random_indexes.map do |i|
    frame[i]
  end
end
