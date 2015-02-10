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
		adj_letter = letter.downcase
		begin 
			if adj_letter.length == 0
			end
		rescue 
			raise ArgumentError.new('You must guess something')
			#return false
		end
		begin 
			if adj_letter == nil
			end
		rescue
			raise ArgumentError.new('Cannot guess nil')
			#return false
		end
		begin
			if !(adj_letter =~ /^[a-z]$/)
			end
		rescue
			raise ArgumentError.new('Parameter must be a valid letter')
			#return false
		end
		if !word.include? adj_letter
			if !wrong_guesses.include? adj_letter
				wrong_guesses << adj_letter
			else
				return false
			end
		else
			if !guesses.include? adj_letter
				guesses << adj_letter
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
