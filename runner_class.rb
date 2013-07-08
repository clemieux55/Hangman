require 'pry'
require_relative 'word.rb'
require_relative 'board.rb'
require_relative 'game_setup.rb'

class Runner

	def play_hangman
		game = GameSetup.new
		game.player_number
		@players = game.get_player_names
		@board = Board.new(Word.new.get_random_word)
		
		while true
			for x in @players do 
				puts @board.display_board
				puts "@players #{x} choose a letter"
				response = gets.chomp
				
				if @board.check_if_bang(response)
					guess = game.check_the_word(@board.word)
				elsif guess == true
					break
				end

				if @board.already_guessed?(response)	
					puts 'Letter already guessed choose another!'
					redo
				end

				if @board.guess_a_letter(response) == true
					puts 'Letter is correct!'
				else
					puts 'letter is incorrect'
				end
			end
		end
	end
end

runner = Runner.new
runner.play_hangman
