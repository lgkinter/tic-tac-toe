module TicTacToe

  WINNER_LIST = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

  class Game

    def initialize
      @board = (0..8).to_a
      @player1 = Player.new(nil, 'x')
      @player2 = Player.new(nil, 'o')
      @current_player = nil
      @winner = nil
    end

    def play
      start_game
      loop do
        print_board
        make_move
        if winner?
          puts "#{@winner.name} wins!"
          print_board
          return
        elsif draw?
          puts "It's a draw."
          print_board
          return
        else
          switch_player
        end
      end
    end

    def start_game
      print "First player, please enter your name: "
      @player1.name = gets.chomp
      puts "#{@player1.name}, your marker will be 'x'."
      print "Second player, please enter your name: "
      @player2.name = gets.chomp
      puts "#{@player2.name}, your marker will be 'o'."
      @current_player = rand(0..1) == 0 ? @player1 : @player2
      puts "Let's get started! #{@current_player.name} you have been randomly selected to go first."
    end

    def switch_player
      @current_player = (@current_player == @player1) ? @player2 : @player1
    end

    def print_board
      line_separator = "----------"
      puts "#{@board[0]} | #{@board[1]} | #{@board[2]}"
      puts line_separator
      puts "#{@board[3]} | #{@board[4]} | #{@board[5]}"
      puts line_separator
      puts "#{@board[6]} | #{@board[7]} | #{@board[8]}"
    end

    def valid_move?(move)
      @board[move] == move
    end

    def make_move
      loop do
        print "#{@current_player.name}, enter any available position between 0 and 8: "
        move = gets.chomp.to_i
        if valid_move?(move)
          @board[move] = @current_player.marker
          return
        else
          puts "Invalid move. Try again."
        end
      end
    end

    def winner?
      WINNER_LIST.each do |win_set|
        if @board[win_set[0]] == @board[win_set[1]] && @board[win_set[0]] == @board[win_set[2]]
          @winner = (@board[win_set[0]] == "x") ? @player1 : @player2
          return true
        end
      end
      return false
    end

    def draw?
      @board.all? {|square| square == 'x' || square == 'o'}
    end
  end

  class Player
    attr_accessor :name, :marker

    def initialize (name, marker)
      @name = name
      @marker = marker
    end
  end

end

include TicTacToe
Game.new.play
