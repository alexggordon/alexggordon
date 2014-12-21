require 'rubygems'
require 'sinatra'
require 'sinatra/assetpack'
require 'bundler/setup'
require 'app'
Bundler.require

root_dir = File.dirname(__FILE__)
app_file = File.join(root_dir, 'alexggordon.rb')
require app_file

set :root,        root_dir
set :app_file,    app_file

run Sinatra::Application
