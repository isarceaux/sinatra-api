require 'bundler/setup'
require 'sinatra/base'
require 'json'

class Api < Sinatra::Base

  get '/' do
    'hello world!'
  end

	get '/hello' do
		'Hello world!'
	end

  get '/movies' do
    content_type :json
    a = JSON.parse(File.read('data.json'))
    a.fetch("movies").to_json
  end

  get '/movies/:id' do
    content_type :json
    a = JSON.parse(File.read('data.json'))
    a.fetch("movies")[(params[:id].to_i)-1].to_json

  end

end
