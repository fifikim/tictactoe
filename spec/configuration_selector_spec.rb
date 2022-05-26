require 'console'
require 'configuration_selector'
require 'game'
require 'stringio'

describe ConfigurationSelector do
  describe '.select_options' do
    before do
      @console = Console.new
      $stdout = StringIO.new
    end

    context "when Player Menu choice 1 and Order Menu choice 1 are selected" do
      it 'creates a Game with the correct configurations' do
        allow($stdin).to receive(:gets).and_return('1', '1')
        @game = ConfigurationSelector.select_options(@console)
        expect(@game.current_player.name).to eq('Player 1')
      end
    end

    context "when Player Menu choice 1 and Order Menu choice 2 are selected" do
      it 'creates a Game with the correct configurations' do
        allow($stdin).to receive(:gets).and_return('1', '2')
        @game = ConfigurationSelector.select_options(@console)
        expect(@game.current_player.name).to eq('Player 2')
      end
    end

    context "when Player Menu choice 2 and Order Menu choice 1 are selected" do
      it 'creates a Game with the correct configurations' do
        allow($stdin).to receive(:gets).and_return('2', '1')
        @game = ConfigurationSelector.select_options(@console)
        expect(@game.current_player.name).to eq('Computer')
      end
    end

    context "when Player Menu choice 2 and Order Menu choice 2 are selected" do
      it 'creates a Game with the correct configurations' do
        allow($stdin).to receive(:gets).and_return('2', '2')
        @game = ConfigurationSelector.select_options(@console)
        expect(@game.current_player.name).to eq('Player 1')
      end
    end
  end
end

