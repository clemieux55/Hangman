require 'pry'
require_relative 'word.rb'
require_relative 'hangman.rb'

class Runner

	def self.play_hangman
		@hangman = HangMan.new(Word.word)
		@players = get_players(player_number)

		while true
			for x in @players do 
				puts @hangman.display_board
				puts "@players #{x} choose a letter"
				response = gets.chomp
				
				if @hangman.already_guessed?(response)	
					puts 'Letter already guessed choose another!'
					redo
				end

				if @hangman.check_if_bang(response)
					puts 'What is your guess'
					response = gets.chomp
				elsif @hangman.check_the_word(response)
					'You won the game!'
					break
				else
					'You loose a turn!'
				end

				if @hangman.guess_a_letter(response) == true
					puts 'Letter is correct!'
				else
					puts 'letter is incorrect'
				end
			end
		end
	end

	def self.player_number
		puts 'How many players 1..5 ? :'
		response = gets.chomp.to_i
		if (1..5).include?(response)
			@number = response
		else
			player_number
		end
	end

	def self.get_players(number)
		players = []
		for x in 1..@number
			puts "Player #{x}'s name: "
			response = gets.chomp
			if players.include?(response)
				puts 'Please pick a unique name: '
				redo
			else
				players = players.shuffle + [response]
			end
		end
	end
end






Runner.play_hangman
