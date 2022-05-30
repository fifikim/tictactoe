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

    @console.output("\nStarting new game...\n\n")
    game.play

    @console.output('Thanks for playing! Goodbye.')
  end
end
