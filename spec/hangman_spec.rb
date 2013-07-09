require 'rspec'
require 'pry'
require_relative '../word.rb'
require_relative '../HangMan.rb'

describe HangMan do 

	let!(:hangman) { HangMan.new(Word.word) }
	let(:word) { hangman.word }

	it 'displays a board with the same length as the word' do 
		expect(hangman.board.length).to eql(word.length)
	end

	it 'shows the blanked out screen for the word' do 
		expect(hangman.board).to include('_')
	end
end

describe 'guessing a letter' do 

	let!(:hangman) { HangMan.new('hello') }

	it 'lets the user guess a letter and stores that letter guessed' do 
		expect(hangman.guess_a_letter("h")).to be_true
	end

	it 'lets the user know if the letter was guessed or not' do 
		expect(hangman.guess_a_letter("g")).to be_false
	end
end

describe 'it lets the user guess a word to win the game' do
	
	let(:hangman) {HangMan.new("hello") }
	
	it 'checks if a bang is present to prompt the user for a guessed word' do 
		expect(hangman.check_if_bang("!")).to be_true
		end

		it 'makes sure if command is not bang it returns false ' do 
			expect(hangman.check_if_bang("a")).to be_false
		end
end