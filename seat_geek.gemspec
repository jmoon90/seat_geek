# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'seat_geek/version'

Gem::Specification.new do |spec|
  spec.name          = "seat_geek"
  spec.version       = SeatGeek::VERSION
  spec.authors       = ["John Moon"]
  spec.email         = ["johnmoonyy@gmail.com"]
  spec.summary       = %q{SeatGeek Uuby wrapper}
  spec.description   = %q{A Ruby gem for communicating with the SeatGeek REST API}
  spec.homepage      = "https://github.com/jmoon90/seat_geek"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry-byebug"
  spec.add_development_dependency "awesome_print"

  spec.add_runtime_dependency "scoped_attr_accessor"
  spec.add_dependency "typhoeus"
  spec.add_dependency "oj"

  spec.add_dependency "vcr"
end
