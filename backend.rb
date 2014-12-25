require 'base64'
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

  # Note: Storing your actual Klarna credentials this way is a bad idea
  API_KEY = 'test_7dd90641-6130-4817-879d-a79cf8913fa7'
  API_SECRET = 'test_b374acd26a56048244aefbd39ba8dc615bbb174f9619d74160d025a08774692b'

  post '/pay' do
    content_type :json

    authorize_request_options = {
      basic_auth: Base64.strict_encode64("#{API_KEY}:#{API_SECRET}"),
      headers: { 'Content-Type' => 'application/json' },
      body: {
        reference:        params[:reference],
        name:             params[:name],
        order_amount:     params[:cost],
        order_tax_amount: params[:tax],
        currency:         params[:currency],
        capture:          false
      }
    }

    authorize_url = "https://inapp.playground.klarna.com/api/v1/users/#{params[:userToken]}/orders"
    authorize_payment_response = HTTParty.post(authorize_url, authorize_request_options)

    pp authorize_payment_response
  end
end
