class HangpersonGame

	def initialize(new_word)
		@word = new_word
		@guesses = ''
		@wrong_guesses = ''
	end

	attr_accessor :word
	attr_accessor :guesses
	attr_accessor :wrong_guesses

	def guess(letter)
		#Processes a guess and modifies the instance variables
		#wrong_guesses and guesses accrodingly
		if letter.empty?
			raise ArgumentError.new('You must guess something')
		elsif letter == nil
			raise ArgumentError.new('Cannot guess nil')
		elsif !word.include? letter
			if !wrong_guesses.include? letter
				wrong_guesses << letter
			else
				return false
			end
		else
			if !guesses.include? letter
				guesses << letter
			else
				return false
			end
		end
	end

	#def check_win_or_lose
		#returns one of the symbols :win, :lose, or :play depending
		#on the current game state

	#end

	#def word_with_guesses
		#substitues the correct guesses made so far into the word
		#regex @word.gsub(guesses list, '-')

	#end

  # add the necessary class methods, attributes, etc. here
  # to make the tests in spec/hangperson_game_spec.rb pass.

  # Get a word from remote "random word" service

  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://watchout4snakes.com/wo4snakes/Random/RandomWord')
    Net::HTTP.post_form(uri ,{}).body
  end

end
