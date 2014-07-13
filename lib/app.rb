require 'sinatra/base'
require 'sinatra'
require 'json'
require_relative 'anagrams_finder'

class App < Sinatra::Base
	af = AnagramsFinder.new
	get '/:word' do
		result = {}
		words = params[:word].split(",")
		words.each {|w| result[w] = af.find_anagrams(w)}
		result.to_json
	end
end