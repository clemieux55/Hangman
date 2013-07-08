require 'rspec'
require 'pry'
require_relative '../word.rb'
require_relative '../board.rb'

describe Board do 
	let(:word) { Word.new.get_random_word }
	let(:board) { Board.new(word) }

	it 'displays a board with the same length as the word' do 
		output = board.set_the_game_board_up
		expect(output.length).to eql(word.length)
	end

	it 'shows the blanked out screen for the word' do 
		output = board.set_the_game_board_up
		expect(output.length).to eql(word.length)
	end
end

describe 'guessing a letter' do 
	let(:board) { Board.new('hello') }

	it 'lets the user guess a letter and stores that letter guessed' do 
		output = board.guess_a_letter("h")
		expect(output).to be_true
	end

	it 'lets the user know if the letter was guessed or not' do 
		output = board.guess_a_letter("g")
		expect(output).to be_false
	end
end

describe 'it lets the user guess a word to win the game' do
	let(:board) {Board.new("hello") }
	
	it 'checks if a bang is present to prompt the user for a guessed word' do 
		output = board.check_if_bang("!")
		expect(output).to be_true
		end

		it 'makes sure if command is not bang it returns false ' do 
			output = board.check_if_bang("a")
			expect(output).to be_false
		end
end