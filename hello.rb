#!/usr/bin/env ruby   #<< Remember the shabang line!?
require 'sinatra'
require 'erb'
require './helpers/string_helper.rb'

# Helper methods
helpers StringHelper do 
  # def reverser(str)
  #   str.reverse
  # end
end


# Set our root path to respond with "Hello, World"
get '/' do
  erb :hello
end

# Get our decoder form
get '/decoder' do
  erb :decoder, :layout => :special_layout
end

# Submit the decoder form
post '/decode' do
  # Decode our secret string with a code
  decoded = reverser(params[:secret_code])
  erb :decoded, :locals => { :decoded => decoded }
end

