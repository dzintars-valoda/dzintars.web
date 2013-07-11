# encoding: utf-8

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
  code = code_formatting(params[:code])
  eval Dzintars::Kompilators.new.uz_ruby(code)
  $stdout.string
end

private

  def code_formatting(code)
    code = code.gsub('`', '\'')
    code = 'puts \'Lūdzu tā nedariet, man sāp\'' if code.include?('%x{')
    code
  end