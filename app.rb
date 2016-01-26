require 'rubygems'
require 'bundler'
Bundler.require

require 'sinatra'
require 'sinatra/asset_pipeline'

# Setup load paths
$: << File.expand_path('../', __FILE__)
$: << File.expand_path('../lib', __FILE__)

Dir['lib/**/*.rb'].sort.each { |file| require file }

require 'app/helpers'
helpers Helpers

# Application configuration options.
configure do
  set :views, 'app/views'

  # CSS minification
  set :assets_css_compressor, :sass
  # JavaScript minification
  set :assets_js_compressor, :uglifier
end

register Sinatra::AssetPipeline

get '/' do
  render_template :index
end

post '/brief' do
  page = Fetch.html_from(params[:search_url])
  html = page.read
  summary = Summary.new(html).elements

  render_template :brief, locals: { code: 200, body: html, summary: summary }
end

not_found do
  render_template :not_found
end
