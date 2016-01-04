require 'seat_geek'
require 'byebug'
require 'ap'

RSpec.configure do |config|
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
end
