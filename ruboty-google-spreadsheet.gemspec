# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruboty/google_spreadsheet/version'

Gem::Specification.new do |spec|
  spec.name          = "ruboty-google-spreadsheet"
  spec.version       = Ruboty::GoogleSpreadsheet::VERSION
  spec.authors       = ["Naoto Kaneko"]
  spec.email         = ["naoty.k@gmail.com"]
  spec.summary       = %q{Store Ruboty's memory in Google Spreadsheet.}
  spec.homepage      = "https://github.com/naoty/ruboty-google-spreadsheet"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "ruboty"
  spec.add_dependency "google_drive"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry"
end
