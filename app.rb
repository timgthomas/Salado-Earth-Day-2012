require 'rubygems'
require 'cgi'
require 'sinatra'

get '/' do
	erb :index
end