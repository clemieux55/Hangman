require 'random-word'
require 'rspec'

class Word

	attr_reader :word

	def get_random_word
		@word = RandomWord.adjs.next.to_s


	end



end



describe Word do
	describe 'it gives an random word' do 
		it 'makes sure the word given is located in the dictionary of words' do 
			word = Word.new.get_random_word
			expect(RandomWord.adjs).to include(word)
		end
	end
end
