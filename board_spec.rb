require 'rspec'
require 'pry'
require_relative 'word.rb'
require_relative 'board.rb'

describe Board do 
	describe 'it sets up the board according to the word given' do 


		it 'displays a board with the same length as the word' do 
			word = Word.new.get_random_word
			board = Board.new(word)
			output = board.set_the_game_board_up
			expect(output.length).to eql(word.length)

		end

		it 'shows the blanked out screen for the word' do 
			word = Word.new.get_random_word
			board = Board.new(word)
			output = board.set_the_game_board_up
			expect(output.length).to eql(word.length)
		end

# As a hangman player
# I want to guess a letter
# So that I can get closer to guessing the word

		it 'lets the user guess a letter and stores that letter guessed' do 
			board = Board.new("hello")
			output = board.guess_a_letter("h")
			expect(output).to be_true
		end

		it 'lets the user know if the letter was guessed or not' do 
			board = Board.new("hello")
			output = board.guess_a_letter("g")
			expect(output).to be_true
		end
	end

	describe 'it lets the user guess a word to win the game' do 
		it 'checks if a bang is present to prompt the user for a guessed word' do 
			board = Board.new("hello")
			output = board.check_if_bang("!")
			expect(output).to be_false
 		end

 		it 'makes sure if command is not bang it returns false ' do 
 			board = Board.new("hello")
 			output = board.check_if_bang("a")
 			expect(output).to be true
 		end

 		it 'prompts the user for a word guess' do 
 			board = Board.new("hello")
 			output = board.check_the_word
 			expect(output).to be_false

 		end


	end
end