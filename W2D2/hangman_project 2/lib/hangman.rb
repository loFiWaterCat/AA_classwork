class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  attr_reader :guess_word, :attempted_chars, :remaining_incorrect_guesses

  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman::random_word
    @guess_word = Array.new(@secret_word.length, "_")
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def already_attempted?(char)
    return true if @attempted_chars.include?(char)
    false
  end

  def get_matching_indices(char)
    indexes = []
    @secret_word.each_char.with_index do |c, i|
      if char == c
        indexes << i
      end
    end

    indexes
  end

  def fill_indices(char, arr)
    arr.each do |i|
      @guess_word[i] = char
    end
  end

  def try_guess(char)
    if already_attempted?(char)
      p 'that has already been attempted'
      return false
    end
    @attempted_chars << char
    index = get_matching_indices(char)
    fill_indices(char, index)

    if index.length == 0
      @remaining_incorrect_guesses -= 1
    end
    true
  end

  def ask_user_for_guess
    p 'Enter a char'
    input = gets.chomp
    try_guess(input)
  end

  def win?
    if @guess_word.join == @secret_word
      p 'WIN'
      true
    else
      false
    end
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      p 'LOSE'
      true
    else
      false
    end
  end

  def game_over?
    if win? || lose?
      p @secret_word
      return true
    end
    false
  end



end
