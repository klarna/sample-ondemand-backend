require 'httparty'
require 'sinatra/base'

if ENV['RACK_ENV'] == 'development'
  require 'sinatra/reloader'
  require 'pry'
end

class Backend < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  post '/pay' do
    content_type :json
    if(params[:failure] == 'true')
      status 500
      { text: 'Payment failed' }.to_json
    else
      { text: HTTParty.get('http://www.iheartquotes.com/api/v1/random').parsed_response }.to_json
    end
  end
end
