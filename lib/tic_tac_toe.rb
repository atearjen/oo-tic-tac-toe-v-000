

class TicTacToe

  def initialize
    @board  = Array.new(9," ")
  end

  def board
    @board
  end

  def board= (new_board)
    @board = new_board
  end

   # Creates an array with 9 elements filled with " "
   WIN_COMBINATIONS = [
   [0,1,2], # Top row
   [3,4,5],  # Middle row
   [6,7,8], #bottom row
   [0,3,6], #first columns
   [1,4,7], #2nd columns
   [2,5,8], #3rd columns
   [0,4,8], #first diagonals
   [2,4,6] #diagonal 2nd
   ]
   def input_to_index(input)
     index = input.to_i
     index -= 1
   end

  def current_player(board)
    turn_count(board) % 2 == 0 ? "X" : "O"
  end

  def move(index,token = "X")
    @board[index] = token
  end

  def position_taken?(index)
    !(board[index].nil? || board[index] == " ")
  end

  def valid_move?(index)
    if index <= 8 && index >= 0
      if (position_taken?(index) == false)
        return true
      end
    else
      return false
    end
  end

  def turn_count
    board.count{|token| token == "X" || token == "O"}
  end

  def current_player

  end

  def turn(board)
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(board,index) == true
      player_move(board,index,current_player(board))
      display_board(board)
    else
      turn(board)
    end
  end



  def display_board
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end

end
