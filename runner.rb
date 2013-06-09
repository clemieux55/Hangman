require_relative 'word.rb'
require_relative 'board.rb'

class Runner

	def initialize
		@players = Array.new

	end


	def get_number_of_players
		puts 'Please give me the number of players (1..5)'
		input = gets.chomp.to_i
		while input > 5 || input < 1
			puts 'Please choose between (1-5)'
			input = gets.chomp.to_i
		end

		input
	end

	def get_player_names_and_random_order
		number = get_number_of_players.to_i
		x = 1
		while number >= x
			puts "Player #{x} name: "
			input = gets.chomp
			if @players.include?(input)
				puts "Player #{x} please choose a unique name :"
				input = gets.chomp
			end
		x += 1
		@players << input
		end

		@players.shuffle
	end

	def play_game
		x = 0
		board = Board.new(Word.new.get_random_word)
		players = get_player_names_and_random_order
		while true
			puts board.display_board
			puts "#{players[x]} please choose a letter :"
			input = gets.chomp
			board.guess_a_letter(input)
			if board.check_if_bang(input) == false
				check = board.check_the_word
				if check == true
				puts "#{players[x]} has won the game"
				break
				else 
					puts "You guessed wrong! You loose a turn!"
					x += 1
				end
			end
			x += 1
			if x >= players.length
			x = 0
			end
		end
	end
end



	

runner = Runner.new
runner.play_game
