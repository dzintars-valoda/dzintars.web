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
  code = params[:code].gsub('`', '\'')
  code = 'puts \'ej dirst\'' if code.include?('%x{')
  eval Dzintars::Kompilators.new.uz_ruby(code)
  $stdout.string
end