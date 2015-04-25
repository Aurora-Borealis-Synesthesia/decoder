source 'https://rubygems.org'

running_bundle_install = $PROGRAM_NAME.match(/bundle\z/) &&
                         (ARGV.empty? || ARGV.include?('install'))

dependancy_warning = "
I see you're installing the dependancies. Don't forget that you also have to
install the `ruby-opencv` gem first, as well as the OpenCV library itself. See
the 'Installation' section of the README for more information.
"

puts dependancy_warning if running_bundle_install

group :development do
  gem 'pry'
  gem 'rspec'
end

# In it's own group in case you want to `bundle install --without opencv`
group :opencv do
  gem 'ruby-opencv', '0.0.13'
end
