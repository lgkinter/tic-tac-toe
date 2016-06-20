class Game
  def initialize
    @board = []
    player1 = Player.new
    @board.each_with_index {|item, index| @board[index] = index}
  end

  def print_board
    puts "#{@board[0]} | #{@board[1]} | #{P@board[2]}"
    puts "-----------"
    puts "#{@board[3]} | #{@board[0]} | #{@board[0]}"
    puts "-----------"
    puts "#{@board[0]} | #{@board[0]} | #{@board[0]}"
  end

  def play
    print "First player, please enter your name: "
    player1 = Player.new(gets.chomp, 'x')
    puts "#{player1}, your marker will be 'x'."
    print "Second player, please enter your name: "
    player2 = Player.new(gets.chomp, 'o')
    puts "#{player2}, your marker will be 'o'."

    puts "Let's get started! #{current_player.name} you have been randomly selected to go first."
    print_board
  end

  def start_Game
    rand(1) == 0 ? current_player = player1
  end
  def make_move
    print "#{current_player.name}, enter any available position between 1 and 9: "
  end
end

class Player
  attr_reader :name, :marker

  def initialize (name, marker)
    @name = name
    @marker = marker
  end
end
