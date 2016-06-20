class TicTacToe

  WINNER_LIST = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
  # no good comment
  
  def initialize
    @board = []
    @board.each_with_index {|item, index| @board[index] = index}
    @winner = nil
  end

  def print_board
    puts "#{@board[0]} | #{@board[1]} | #{@board[2]}"
    puts "-----------"
    puts "#{@board[3]} | #{@board[4]} | #{@board[5]}"
    puts "-----------"
    puts "#{@board[6]} | #{@board[7]} | #{@board[8]}"
  end

  def play
    start_game
    loop do
      if winner?
        puts "#{@winner.name} wins!"
        print_board
        return
      elsif draw?
        puts "It's a draw."
        print_board
        return
      else
        make_move
        print_board
      end
  end

  def start_game
    print "First player, please enter your name: "
    @player1 = Player.new(gets.chomp, 'x')
    puts "#{player1}, your marker will be 'x'."
    print "Second player, please enter your name: "
    @player2 = Player.new(gets.chomp, 'o')
    puts "#{player2}, your marker will be 'o'."
    @current_player = rand(1) == 0 ? player1 : player2
    puts "Let's get started! #{current_player.name} you have been randomly selected to go first."
  end

  def get_move
    print "#{current_player.name}, enter any available position between 0 and 8: "
    gets.chomp
  end

  def valid_move?

  end

  def make_move

  end
  def winner?
    WINNER_LIST.each do |win_set|
      if @board[win_set[0]] == @board[win_set[1]] && @board[win_set[0]] == @board[win_set[2]]
        @winner = @board[win_set[0]] == "x" ? @player1 : @player2
      end
    end
  end

  def draw?
    @board.all? {|square| square == 'x' || square == 'o'}
  end
end

class Player
  attr_reader :name, :marker

  def initialize (name, marker)
    @name = name
    @marker = marker
  end
end
