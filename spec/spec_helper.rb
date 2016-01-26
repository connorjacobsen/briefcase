require 'rack/test'
require 'rspec'
require 'rspec/its'

ENV['RACK_ENV'] = 'test'

require File.expand_path('../../app.rb', __FILE__)

module RSpecMixin
  include Rack::Test::Methods
  def app() Sinatra::Application end
end

RSpec.configure do |config|
  config.include RSpecMixin
end
