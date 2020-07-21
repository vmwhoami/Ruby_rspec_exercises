require_relative "board"
require_relative "player"

class Battleship
    def initialize(n)
        @player = Player.new
        @board =  Board.new(n)
        @remaining_misses = @board.size / 2 
    end

    def board
        @board
    end

    def player
        @player
    end

    def start_game
        @board.place_random_ships
        puts "The number of ships placed on the board is #{@board.num_ships}"
        @board.print
    end

    def lose?
        if @remaining_misses <= 0
            puts "You have to lose to be a winner"
            return true
        end
        return false
    end

    def win?
       if @board.num_ships == 0
        puts 'you win'
        return true
       end
       return false
    end

    def game_over?
        if self.lose? || self.win?
            return true
        end
        false
    end

    def turn
    move = @player.get_move
    if @board.attack(move)
    
    else
       @remaining_misses-=1
    end
     
      @board.print
      puts @remaining_misses
   
    end
end
