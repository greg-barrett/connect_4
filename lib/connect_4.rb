class Game
  @@marks=0
  def make_board
    @board= [ [".", ".", ".", "."], [".", ".", ".", "."],
                  [".", ".", ".", "."], [".", ".", ".", "."] ]
  end

  def mark(column)
    assigned=false
    row=3
    column.downcase!
    if column == "a"
      c=0
    elsif column =="b"
      c=1
    elsif column =="c"
      c=2
    elsif column =="d"
      c=3
    else
      puts "Turn out of range. Try again"
      return "Turn out of range. Try again"
    end
    until assigned==true || row==-1
      if @board[row][c]=="."
         @board[row][c]=@mark
         @@marks+=1
         assigned=true
      else
         row-=1
      end
    return "Column full." if row == -1
    end
   @board
  end

  def win?
    if
    #row
       @board[0][0] == @board[0][1] &&  @board[0][0] == @board[0][2] && @board[0][0] == @board[0][3] && @board[0][0] !="." ||
       @board[1][0] == @board[1][1] &&  @board[1][0] == @board[1][2] && @board[1][0] == @board[1][3] && @board[1][0] !="." ||
       @board[2][0] == @board[2][1] &&  @board[2][0] == @board[2][2] && @board[2][0] == @board[2][3] && @board[2][0] !="." ||
       @board[3][0] == @board[3][1] &&  @board[3][0] == @board[3][2] && @board[3][0] == @board[3][3] && @board[3][0] !="." ||
    #column
       @board[0][0] == @board[1][0] &&  @board[0][0] == @board[2][0] && @board[0][0] == @board[3][0] && @board[0][0] !="." ||
       @board[0][1] == @board[1][1] &&  @board[0][1] == @board[2][1] && @board[0][1] == @board[3][1] && @board[0][1] !="." ||
       @board[0][2] == @board[1][2] &&  @board[0][2] == @board[2][2] && @board[0][2] == @board[3][2] && @board[0][2] !="." ||
       @board[0][3] == @board[1][3] &&  @board[0][3] == @board[2][3] && @board[0][3] == @board[3][3] && @board[0][3] !="." ||
    #diagonal
       @board[0][0] == @board[1][1] &&  @board[0][0] == @board[2][2] && @board[0][0] == @board[3][3] && @board[0][0] !="." ||
       @board[3][0] == @board[2][1] &&  @board[3][0] == @board[1][2] && @board[3][0] == @board[0][3] && @board[3][0] !="."
       true
    else
      false
    end
  end

  def show_board
    print"\n\n"
    puts @board[0].join("   ")
    print"\n"
    puts @board[1].join("   ")
    print"\n"
    puts @board[2].join("   ")
    print"\n"
    puts @board[3].join("   ")
    print"\n\n"
  end

  def draw?
    if @@marks==16
      puts "It's a draw"
      true
    else
      false
    end
  end

  def current_player
    if @@marks % 2 ==0
      @mark="X"
    else
      @mark="O"
    end
    @mark
  end
end

class Player
  attr_accessor :name
  def initialize(name)
    @name=name
  end
end

#game play

#Sets player 1's name
print"\n\n"
puts "Welcome to connect four"
print"\n\n"
puts "Player 1, what is your name?"
print"\n"
name=gets.chomp
player_1= Player.new(name)

#Sets player 2's name
print"\n\n"
puts "Player 1, what is your name"
print"\n"
name=gets.chomp
player_2= Player.new(name)

#Initiates game and creates a board
the_game=Game.new
the_game.make_board

#Game loop- Until there is a win or a draw, game will play
until the_game.win? ==true || the_game.draw? ==true
  print"\n\n"
  puts "#{player_1.name}, please take your turn..."
  print"\n\n"
  the_game.current_player
  turn=gets.chomp
  #Loops until a valid input is made
  until ["a", "b", "c", "d"].include?(turn) && the_game.mark(turn) != "column full"
    print"\n\n"
    puts "Please take a valid turn"
    turn=gets.chomp
  end
  the_game.show_board
  #Checks to see if player 1's move caused a win or draw.
break if the_game.win? ==true || the_game.draw? ==true

  #Player 2's turn, other details as aabove.
  puts "#{player_2.name}, please take your turn..."
  the_game.current_player
  turn=gets.chomp
  until ["a", "b", "c", "d"].include?(turn) && the_game.mark(turn) != "column full"
    print"\n\n"
    puts "That's not a valid move, please try again"
    turn=gets.chomp
  end
  the_game.show_board
end

if the_game.win? == true
  puts "Congratulations we have a winner!"
end
