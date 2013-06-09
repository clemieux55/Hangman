require 'pry'

class Board

	attr_reader :board

	def initialize(word)
		@word = word
		@guessed_letters = Array.new
		@letters_not_guessed = ("a" .. "z").to_a
		@it_the_correct_letter = "Letter is correct!"
		@letter_is_not_found = "Letter is not found!"

	end

	def set_the_game_board_up
		length_of_word = @word.length
		@board = Array.new(length_of_word, "_")

	end

	def guess_a_letter(letter)
		if @word.split("").include?(letter.downcase)
			@guessed_letters << letter.downcase
			puts @it_the_correct_letter
			true
		else
			puts @letter_is_not_found
			@guessed_letters << letter.downcase 
			false
		end

		@letters_not_guessed = @letters_not_guessed - [letter]
	end

	def check_if_bang(input)
		if input == "!"
			false
		else 
			true
		end
	end

	def check_the_word
			puts "What is your guess? :"
			input = gets.chomp
			if input == @word
				puts "The word is correct!"
				true
			else
				false
		end
	end

	def display_board
		word = "[" + @letters_not_guessed.join() + "]" 
		@word.gsub(Regexp.new(word),"_")
	end


end

