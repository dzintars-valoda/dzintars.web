require 'sinatra'
require 'dzintars/kompilators'

configure :production do
  require 'newrelic_rpm'
end

get '/' do
  erb :index
end

post '/' do
  $stdout = StringIO.new
  eval Dzintars::Kompilators.new.uz_ruby(params[:code])
  $stdout.string
end
