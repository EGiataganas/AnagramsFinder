class AnagramsFinder
	def find_anagrams(word)
		words = []
		f = File.new("shortwordlist.txt")
		wordlist = f.readlines().map {|w| w.strip}
		wordlist.each do |w| 
			if word.length == w.length && word.chars.sort == w.chars.sort && w!=word
				words.push(w)
			end
		end
		words
	end
end