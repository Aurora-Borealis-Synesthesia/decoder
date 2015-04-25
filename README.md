# Decoder

I hate all video decoding libraries.

## Installation

You'll need to install the OpenCV library. You COULD install it from source,
but it's a serious pain in the ass to do on Debian, and I suspect other
platforms too. I'd recommend installing it with your package manager (i.e. apt
on Debian, Brew on OSX).

Then we'll need to install the ruby libraries as per usual with
`bundle install` in the project directory.

Lastly, the `ruby-opencv` gem. This gem needs to know the directory of the
OpenCV installation, so we can't install it nicely with bundler. Here's the
command you'll need to run

~~~
gem install ruby-opencv -v 0.0.13 -- --with-opencv-dir=/path/to/opencvdir
~~~

So on OSX with brew:

~~~
gem install ruby-opencv -v 0.0.13 -- --with-opencv-dir=`brew --prefix opencv`
~~~

Or on 64bit Debian Jessie:

~~~
gem install ruby-opencv -v 0.0.13 -- --with-opencv-dir=/usr/lib/x86_64-linux-gnu/
~~~

If this is wrong, try looking up one of the packages with `dpkg -L packagename`


## Notes

OpenCV pixels are `blue, red, green, something` ??

## License

    Copyright © 2015 Louis Pilfold. All Rights Reserved.

    This Source Code Form is subject to the terms of the Mozilla Public
    License, v. 2.0. If a copy of the MPL was not distributed with this
    file, You can obtain one at http://mozilla.org/MPL/2.0/.
