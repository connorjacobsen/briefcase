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

  set :assets_precompile, %w(application.js base.css *.png *.jpg *.svg *.eot *.ttf *.woff)
  # CSS minification
  set :assets_css_compressor, :sass
  # JavaScript minification
  set :assets_js_compressor, :uglifier

  register Sinatra::AssetPipeline

  # Actual Rails Assets integration, everything else is Sprockets
   if defined?(RailsAssets)
     RailsAssets.load_paths.each do |path|
       settings.sprockets.append_path(path)
     end
   end
end

get '/' do
  render_template :index
end

post '/brief' do
  html = Fetch.html_from(params[:search_url]).read
  summary = Summary.new(html)

  render_template :brief,
    locals: { body: summary.html, summary: summary.elements }
end

not_found do
  render_template :not_found
end
