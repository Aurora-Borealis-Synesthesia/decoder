#!/usr/bin/env ruby

# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

require 'opencv'

require_relative '../lib/decoder.rb'

abort "Usage: #{__FILE__} path/to/video" if ARGV.empty?

vid = Video.new(ARGV.first)

samples = vid.serialize

require 'pry'; binding.pry

puts 'Done'
