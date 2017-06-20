require 'sinatra'
require 'sinatra/reloader' if development?

get '/no_cache' do
  request_time = DateTime.now.strftime("%Y-%m-%d %H:%M:%S")
  "Request path: /no_cache\nLast sinatra request time is #{request_time}"
end

get '/cache' do
  request_time = DateTime.now.strftime("%Y-%m-%d %H:%M:%S")
  "Request path: /cache\nLast sinatra request time is #{request_time}"
end
