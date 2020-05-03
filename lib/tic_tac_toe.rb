class TicTacToe

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,4,8],
    [2,4,6],
    [0,3,6],
    [1,4,7],
    [2,5,8]
  ]  

  def initialize 
    @board = [] 
    9.times do 
      @board << " " 
    end
  end 

  def display_board 
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} " 
  end 

  def input_to_index(user_input)
    user_input.to_i - 1 
  end

  def move(index, player_token="X")
    @board[index] = player_token
  end

  def position_taken?(index)
    @board[index] != " "
  end 

  def valid_move?(i)
    i.between?(0,8) && !position_taken?(i)
  end 

  def turn_count
    @board.select do |i|
      i != " "
    end.length
  end 

  def current_player 
    if turn_count % 2 > 0
      return "O"
    else 
      "X"
    end
  end

  def turn
    puts "pick a position between 1-9"
    position = gets.strip
    index = input_to_index(position)
    if valid_move?(index)
      move(index, current_player)
    else 
      self.turn
    end
    display_board
  end 

  def won?
    winner = false
    WIN_COMBINATIONS.each do |wc|
      if @board[wc[0]] == "X" || @board[wc[0]] == "O"
        if (@board[wc[0]] == @board[wc[1]]) && (@board[wc[1]] == @board[wc[2]])
          winner = wc
        end
      end 
    end
    winner 
  end

  def full? 
    @board.select do |position|
      position == "X" || position == "O"
    end.length == 9
  end

  def draw? 
    self.full? && !self.won?      
  end

  def over?
    self.won? || self.draw?
  end 

  def winner
    if won? 
      @board[won?[0]]
    else
      nil
    end 
  end 

  def play 
    until over? do 
      turn
    end
    if won? 
      puts "Congratulations #{self.winner}!"
    else
      puts "Cat's Game!"
    end
  end
end 

