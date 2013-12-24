require 'rubygems'
require 'bundler/setup'
require 'bearclaws'

RSpec.configure do |config|
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.mock_with :rspec do |c|
    c.syntax = [:should, :expect]
  end
end