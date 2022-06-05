class Game

    attr_accessor :turn

    def initialize()
        @board = Array.new(3) {Array.new(3, ' ')}
        @turn = 0
    end

    def print_board()
        puts "   1   2   3"
        for i in 0...3
            puts "#{i+1}| #{@board[i][0]} | #{@board[i][1]} | #{@board[i][2]} |"
        end
    end

    def check_winner()
        for i in 0...3
            if @board[i][0] != ' ' && @board[i][0] == @board[i][1] && @board[i][1] == @board[i][2]
                return true
            elsif  @board[0][i] != ' ' && @board[0][i] == @board[1][i] && @board[1][i] == @board[2][i]
                return true
            end
        end
        if @board[0][0] != ' ' && @board[0][0] == @board[1][1] && @board[1][1] == @board[2][2]
            return true
        elsif @board[2][0] != ' ' && @board[2][0] == @board[1][1] && @board[1][1] == @board[0][2]
            return true
        else
            return false
        end
    end

    def move(row, column)
        if @board[row][column] != ' '
            return false
        end
        if turn % 2 == 0
            @board[row][column] = 'X'
        else
            @board[row][column] = 'O'
        end
        @turn += 1
        return true
    end

end