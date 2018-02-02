module TicTacToe
  class Player
    attr_reader :color

    def initialize(char, color)
      @char = char
      @color = color
    end

    def to_s
      @char.colorize(@color)
    end
  end
end
