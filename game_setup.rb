
require 'pry'

class GameSetup

	def initialize
		@players = []
	end

	def player_number
		puts 'How many players 1..5 ? :'
		response = gets.chomp.to_i
		if (1..5).include?(response)
			@number = response
		else
			puts 'Please choose a number between 1 and 5: '
			play_hangman
		end
	end

	def get_player_names
		for x in 1..@number
			puts "Player #{x}'s name: "
			response = gets.chomp
			if @players.include?(response)
				puts 'Please pick a unique name: '
				redo
			else
				@players = @players.shuffle + [response]
			end
		end
	end


	def check_the_word(word)
			puts "What is your guess? :"
			input = gets.chomp
			if input == word
				puts "The word is correct! You won!"
				true
			else
				puts 'Guess is incorrect! You loose your turn!'
				false
		end
	end
end


