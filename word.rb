require 'random-word'
require 'rspec'

class Word

	attr_reader :word

	def self.word
		@word = RandomWord.adjs.next.to_s
	end
end




