require 'seat_geek'
require 'byebug'
require 'ap'
require 'vcr'
require 'yaml'

VCR.configure do |config|
  config.cassette_library_dir = "spec/vcr_cassettes"
  config.hook_into :typhoeus
  config.default_cassette_options = { record: :none }

  config.ignore_request do |request|
    config.ignore_hosts 'https://api.seatgeek.com/2/'
  end
end

RSpec.configure do |config|
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
end
