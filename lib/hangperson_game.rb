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
		if letter.length == 0
			raise ArgumentError.new('You must guess something')
			return false
		elsif letter == nil
			raise ArgumentError.new('Cannot guess nil')
			return false
		elsif !(letter.downcase =~ /^[a-z]$/)
			raise ArgumentError.new('Parameter must be a valid letter')
			return false
		#adj_letter = letter.downcase
		elsif !word.include? letter.downcase
			if !wrong_guesses.include? letter.downcase
				wrong_guesses << letter.downcase
			else
				return false
			end
		else
			if !guesses.include? letter.downcase
				guesses << letter.downcase
			else
				return false
			end
		end
	end

	def check_win_or_lose
		#returns one of the symbols :win, :lose, or :play depending
		#on the current game state
		if wrong_guesses.length >= 7
			return :lose
		elsif @word == word_with_guesses
		 	return :win
		else
			return :play
		end
	end

	def word_with_guesses
		#substitues the correct guesses made so far into the word
		@word.gsub(/./) do |c|
			if not (@guesses.include? c)
				'-'
			else
				c
			end
		end
	end

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
