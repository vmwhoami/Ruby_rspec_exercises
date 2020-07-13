class Hangman
  DICTIONARY = %w[cat dog bootcamp pizza].freeze
  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.size, '_')
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  attr_reader :guess_word

  attr_reader :attempted_chars

  attr_reader :remaining_incorrect_guesses

  def already_attempted?(char)
    @attempted_chars.include?(char)
  end

  def get_matching_indices(char)
    ar = []
    @secret_word.split('').each_with_index { |ch, indx| ar << indx if ch == char }
    ar
  end

  def fill_indices(char, arr)
    ar = []
    @guess_word.each_with_index { |ch, indx| ar << (arr.include?(indx) ? char : ch) }
    @guess_word = ar
  end

  def try_guess(char)
    if already_attempted?(char)
      puts 'that has already been attempted'
      return false
    end
    @attempted_chars << char
    match = get_matching_indices(char)
    fill_indices(char, match)
    @remaining_incorrect_guesses -= 1 if match.empty?
    true
  end

  def ask_user_for_guess
    print 'Enter a char:'
    @user_imput = gets.chomp
    try_guess(@user_imput)
  end

  def win?
    if @guess_word.join('') == @secret_word
      print 'WIN'
      return true
    end
    false
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      print 'LOSE'
      return true
    end
    false
  end

  def game_over?
    lose?
    win?
    if win?
      print @secret_word
      return true
    end
    if lose?
      print @secret_word
      return true
    end
    false
  end
end
