require 'sinatra'
require 'json'
require 'open-uri'

class AnagramsFinder
	
	def initialize(filename = nil)
		if filename.nil?
			f = open('http://static.abscond.org/wordlist.txt')
			@wordlist = f.readlines().map {|w| w.strip}
		else
			@wordlist = []
			File.open(filename, 'r') do |fp|
				while !fp.eof
					@wordlist << fp.readline.chomp
				end
			end
		end
	end

	def find_anagrams(word)
		words = []
		@wordlist.each do |w| 
			if is_anagram?(word,w)
				words.push(w)
			end
		end
		words
	end

	def is_anagram?(word1,word2)
		if word1.length == word2.length && word1.chars.sort == word2.chars.sort && word1!=word2
			return true
		else
			return false
		end
	end

end

af = AnagramsFinder.new
get '/:word' do
	result = {}
	words = params[:word].split(",")
	words.each {|w| result[w] = af.find_anagrams(w)}
	result.to_json
end
