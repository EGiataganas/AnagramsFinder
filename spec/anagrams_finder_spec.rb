require_relative 'anagrams_finder'
require 'rspec'

describe AnagramsFinder do

	let (:anagram) {Anagram.new}

	it "should give the anagram of the word" do
		expect(anagram.anagrams("cat")).to eq(["act"])
	end

	it "should return an empty array" do
		expect(anagram.anagrams("")).to eq([])
	end

end