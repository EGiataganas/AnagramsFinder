require 'anagrams_finder'
require 'rspec'

describe AnagramsFinder do

	let (:anagram) {AnagramsFinder.new}

	it "should give the anagram of the word" do
		expect(anagram.find_anagrams("cat")).to eq(["act"])
	end

	it "should give the anagram of crepitus word" do
		expect(anagram.find_anagrams("crepitus")).to eq(["cuprites","pictures","piecrust"])
	end

	it "should give the anagram of paste word" do
		expect(anagram.find_anagrams("paste")).to eq(["pates","peats","septa","spate","tapes","tepas"])
	end

	it "should return an empty array" do
		expect(anagram.find_anagrams("")).to eq([])
	end

	it "should return an empty arra for non existing words" do
		expect(anagram.find_anagrams("sdfwehrtgegfg")).to eq([])
	end

	it "should return an empty arra for non existing words" do
		expect(anagram.find_anagrams("team's")).to eq(["mate's","meat's"])
	end

	it "should not return the he's" do
		expect(anagram.find_anagrams("she")).not_to include(["he's"])
	end

	it "should not return the empty array" do
		expect(anagram.find_anagrams("he's")).not_to include(["she"])
	end

	it "should not return the empty array" do
		expect(anagram.find_anagrams("meat")).not_to include(["Meta"])
	end
end