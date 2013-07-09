class HangMan

	attr_reader :word

	def initialize(word)
		@word = word
		@guessed_letters = Array.new
		@letters_not_guessed = ("a" .. "z").to_a
	end

	def board
		@hangman = Array.new(@word.length, "_")
	end

	def guess_a_letter(letter)
		@guessed_letters << letter
		@letters_not_guessed = @letters_not_guessed - [letter]

		if @word.split("").include?(letter.downcase)
			true
		else
			false
		end
	end

	def already_guessed?(letter)
		if @guessed_letters.include?(letter)
			true
		else
			false
		end
	end

	def check_if_bang(input)
		if input == "!"
			true
		else 
			false
		end
	end

	def display_board
		word = "[" + @letters_not_guessed.join() + "]" 
		@word.gsub(Regexp.new(word),"_")
	end

	def check_the_word(guess)
		if guess == @word
			true
		else
			false
		end
	end
end

