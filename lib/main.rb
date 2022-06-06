# frozen_string_literal: true

require_relative 'main_console'
require_relative 'config_selector'

class Main
  def initialize(console = MainConsole.new)
    @console = console
  end

  def run
    @console.welcome

    configs = ConfigSelector.new(@console)
    game = configs.select_options

    @console.new_game
    game.play

    @console.output('Thanks for playing! Goodbye.')
  end
end
