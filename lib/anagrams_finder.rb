require 'open-uri'

class AnagramsFinder
	
	def initialize()
		# f = File.new("wordlist.txt")
		f = open('http://static.abscond.org/wordlist.txt')
		@wordlist = f.readlines().map {|w| w.strip}
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