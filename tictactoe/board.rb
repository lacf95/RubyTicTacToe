module TicTacToe
  class Board

    def initialize(color)
      @color = color
      @turn_count = 0
      @cells = Array.new(9)
    end

    def set_cell(i, player)
      if @cells[i]
        puts "#{@cells[i]} already in that position"
        nil
      else
        @turn_count += 1
        @cells[i] = player
      end
    end

    def someone_won?
      if compare(0,1,2) || compare(0,4,8) || compare(0,3,6)
        @cells[0]
      elsif compare(3,4,5) || compare(1,4,7) || compare(2,4,6)
        @cells[4]
      elsif compare(6,7,8) || compare(2,5,8)
        @cells[8]
      elsif @turn_count == 9
        'Draw'
      end
    end

    def render
      line = '│'.colorize(@color)
      puts ' ┌───────┐ '.colorize(@color)
      2.step(8, 3) do |i|
        puts " #{line} #{get_cell(i - 2)} #{get_cell(i - 1)} #{get_cell(i)} #{line} "
      end
      puts ' └───────┘ '.colorize(@color)
    end
    
    private
      def compare(i1, i2, i3)
        @cells[i1] == @cells[i2] && @cells[i2] == @cells[i3]
      end

      def get_cell(i)
        @cells[i] || i + 1
      end
  end
end
