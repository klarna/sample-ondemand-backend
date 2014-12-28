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
  API_KEY = 'test_d8324b98-97ce-4974-88de-eaab2fdf4f14'
  API_SECRET = 'test_846853f798502446dbaf11ee8365fef2e533ddde1f5d6a6caa961398a776c08c'

  def centify(amount_string)
    (amount_string.to_f * 100).to_i
  end

  post '/pay' do
    params.merge!(JSON.parse(request.body.read))

    basic_auth_options = {
      basic_auth: { username: API_KEY, password: API_SECRET}
    }

    authorize_request_options = {
      headers: { 'Content-Type' => 'application/json' },
      body: {
        reference:        params[:reference],
        name:             params[:name],
        order_amount:     centify(params[:cost]),
        order_tax_amount: centify(params[:tax_cost]),
        currency:         params[:currency],
        capture:          false
      }.to_json
    }.merge!(basic_auth_options)

    authorize_url = "https://inapp.playground.klarna.com/api/v1/users/#{params[:user_token]}/orders"
    authorize_payment_response = HTTParty.post(authorize_url, authorize_request_options)

    if (authorize_payment_response && authorize_payment_response.code == 201)
      HTTParty.post("#{authorize_payment_response}/capture", basic_auth_options)
    else
      halt authorize_payment_response.code, 'something bad happened'
    end
  end
end
