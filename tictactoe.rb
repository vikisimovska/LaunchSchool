require 'pry'
# use it by typing binding.pry, CTR + D to keep going!!
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8]] +
                [[3, 6, 9], [1, 5, 9], [3, 5, 7]]
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
# $player_count = 0
# $computer_count = 0
# ****************************************
def prompt(msg)
  puts "=> #{msg}"
end
# ****************************************
# board thats passed in here its a hash
# The keys are the num of each square

def display_board(brd)
  system "clear"
  puts "You're a #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
  puts ""
  puts "     |     |"
  puts " #{brd[1]}   |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "_____+_____+_____"
  puts "     |     |"
  puts " #{brd[4]}   |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "_____+_____+_____"
  puts "     |     |"
  puts " #{brd[7]}   |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# ****************************************

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end
# ****************************************

def empty_squares(brd)
  brd.keys.select { |k| brd[k] == INITIAL_MARKER }
end
# ****************************************

def joinor(arr, punc = ', ', word = 'or')
  str = ''
  arr.each_with_index do |e, idx|
    str +=  if idx == arr.size - 1
              word + ' ' + e.to_s
            else
              e.to_s + punc
            end
  end
  str
end
# ****************************************

def player_places_piece!(brd)
  square = ''
  loop do
    if joinor(empty_squares(brd), '; ', 'and').length > 5
      prompt "Choose a square (#{joinor(empty_squares(brd), '; ', 'and')}):"
    else
      prompt "Choose a square (#{joinor(empty_squares(brd), '; ', 'and')
      .split(' ').last}):"
    end
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt 'Sorry that\'s not a valid choice'
  end
  brd[square] = PLAYER_MARKER
end
# ****************************************
# finds the 3rd square thats empty, assuming the other 2 have 'X' mark
# splat operator (*) "explodes" the line array into a comma-separated list.

def find_at_risk_square(line, board)
  if board.values_at(*line).count(PLAYER_MARKER) == 2
    board.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first
  end
end
# ****************************************

def computer_places_piece!(brd)
  square = nil
  WINNING_LINES.each do |line|
    square = find_at_risk_square(line, brd)
    break if square
  end

  if !square
    square = empty_squares(brd).sample
  end

  brd[square] = COMPUTER_MARKER
  prompt "Computer choose square num #{square}"
  sleep(0.5)
end
# ****************************************

def board_full?(brd)
  empty_squares(brd).empty?
end
# ****************************************

def someone_won?(brd)
  # !! turns the value(string) into a boolean
  !!detect_winner(brd)
end
# ****************************************

def detect_winner(brd)
  WINNING_LINES.each do |arr|
    array = [brd[arr[0]], brd[arr[1]], brd[arr[2]]]
    if array.all? { |e| e == PLAYER_MARKER }
      return 'Player'
    elsif array.all? { |e| e == COMPUTER_MARKER }
      return 'Computer'
    end
  end
  nil
end
# ****************************************

def overall_winner_check(player_count, computer_count, brd)
  if player_count.to_i >= 2 || computer_count.to_i >= 2
    prompt "#{detect_winner(brd)} is the overall winner"
    true
  else
    false
  end
end
# ****************************************

def winner_prompt(brd)
  if someone_won?(brd)
    prompt "#{detect_winner(brd)} won this round!"
  else
    prompt "It's a tie!"
  end
end
# **************MAIN***********************

player_counter = "0"
computer_counter = "0"

loop do
  board = initialize_board

  loop do
    display_board(board)

    player_places_piece!(board)
    break if someone_won?(board) ||
             board_full?(board)

    computer_places_piece!(board)
    break if someone_won?(board) ||
             board_full?(board)
  end

  display_board(board)
  winner_prompt(board)

  if detect_winner(board) == 'Player'
    player_counter = (player_counter.to_i + 1).to_s
  elsif detect_winner(board) == 'Computer'
    computer_counter = (computer_counter.to_i + 1).to_s
  end

  prompt "The score is #{player_counter} for the player and #{computer_counter}
  for the computer."

  if overall_winner_check(player_counter, computer_counter, board)
    player_counter = "0"
    computer_counter = "0"
  end

  prompt "Play again? (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing Tic-Tac-Toe! Good bye!"
