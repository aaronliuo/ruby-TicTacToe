require_relative './game.rb'

def ask_placement()
    row = ''
    column = ''
    while row != '1' && row != '2' && row != '3' do
        print "Type a Valid Row number (1, 2, 3): "
        row = gets.chomp
    end
    while column != '1' && column != '2' && column != '3' do
        print "Type a Valid column number (1, 2, 3): "
        column = gets.chomp
    end
    return [row.to_i-1, column.to_i-1]
end

def run_game()
    puts "Welcome to TicTacToe. Standard TicTacToe rules applies."
    puts "Press 1 to play, 0 to quit"
    can_play = gets.chomp
    while can_play == '1' do
        game = Game.new()
        while !game.check_winner() && game.turn < 9 do
            game.print_board()
            puts "It is Player #{game.turn%2+1}'s turn"
            placement = ask_placement()
            while !game.move(placement[0], placement[1]) do
                puts "This position is already taken!"
                placement = ask_placement()
            end
        end
        game.print_board()
        if game.check_winner()
            puts "Player #{(game.turn-1)%2+1} has won!"
        else
            puts "Draw!"
        end
        
        puts "Press 1 to play again, 0 to quit"
        can_play = gets.chomp
    end
end

run_game()