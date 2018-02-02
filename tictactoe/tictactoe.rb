module TicTacToe
  class TicTacToe

    def initialize
      @player_1 = Player.new('O', :cyan)
      @player_2 = Player.new('X', :light_red)
    end

    def start_game
      toggle_players
      @board = Board.new(:yellow)
      play
    end

    private
      def toggle_players
        @player_1, @player_2 = @player_2, @player_1
      end

      def play
        until who_won = @board.someone_won?
          update_screen
          current_player = current_player == @player_1 ? @player_2 : @player_1
          turn(current_player)
        end
        update_screen
        puts who_won.class == Player ? "#{who_won} won" : who_won
      end
      
      def turn(player)
        print "#{player}:"
        if position = get_input
          turn(player) unless @board.set_cell(position, player)
        else
          puts 'Invalid input'
          turn(player)
        end
      end

      def get_input
        validate(readline.chomp)
      end

      def validate(position)
        value = Integer(position)
        value = value > 0 && value < 10 ? value - 1 : nil
      rescue ArgumentError
        nil
      end

      def update_screen
        system('clear')
        render_title
        @board.render
      end

      def render_title
        puts 'Tic '.colorize(@player_1.color) + 'Tac '.colorize(@player_2.color) + 'Toe'
      end
  end
end
