require 'colorize'
all_files = File.join(File.dirname(__FILE__), 'tictactoe', '*.rb')
Dir[all_files].each { |file| require file }
