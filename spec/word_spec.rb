require 'rspec'
require_relative '../word.rb'

describe Word do
	describe 'it gives an random word' do 
		it 'makes sure the word given is located in the dictionary of words' do 
			word = Word.word
			expect(RandomWord.adjs).to include(word)
		end
	end
end