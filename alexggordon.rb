# alexggordon.rb
require 'sinatra'
require 'sinatra/assetpack'

class AlexGGordon < Sinatra::Base
  set :root, File.dirname(__FILE__) # You must set app root

  register Sinatra::AssetPack
end

assets do
  serve '/images', :from => 'app/images'
  serve '/css', :from => 'app/css'

  css :application, [
  ]
  css :skeleton, [
    '/css/skeleton.css'
  ]
  css :normalize, [
    '/css/normalize.css'
  ]
  css :custom, [
    '/css/custom.css'
  ]

  css_compression :none
end

get '/' do
  erb :index
end
