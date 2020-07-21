require_relative 'board'
require_relative 'player'

class Battleship
  def initialize(n)
    @player = Player.new
    @board = Board.new(n)
    @remaining_misses = @board.size / 2
  end

  attr_reader :board

  attr_reader :player

  def start_game
    @board.place_random_ships
    puts "The number of ships placed on the board is #{@board.num_ships}"
    @board.print
  end

  def lose?
    if @remaining_misses <= 0
      puts 'You have to lose to be a winner'
      return true
    end
    false
  end

  def win?
    if @board.num_ships == 0
      puts 'you win'
      return true
    end
    false
  end

  def game_over?
    return true if lose? || win?

    false
  end

  def turn
    move = @player.get_move
    if @board.attack(move)

    else
      @remaining_misses -= 1
    end

    @board.print
    puts @remaining_misses
  end
end
