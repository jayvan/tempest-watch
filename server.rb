require 'haml'
require 'sinatra'

get '/' do
  haml :index
end

post '/api/vote' do

end

get '/api/tempests' do

end

get '/api/tempests/:location' do

end
