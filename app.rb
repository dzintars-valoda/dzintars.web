require 'sinatra'
require "dzintars/kompilators"

get '/' do
  erb :index
end

post '/' do
  $stdout = StringIO.new
  eval Dzintars::Kompilators.new.uz_ruby(params[:code])
  $stdout.string
end
