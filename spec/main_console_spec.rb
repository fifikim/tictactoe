# frozen_string_literal: true

require 'main_console'
require 'human_player'
require 'stringio'

describe MainConsole do
  before do
    @console = MainConsole.new
    $stdout = StringIO.new
  end

  context 'when locale is :en (English)' do
    before do
      @console.switch_language(:en)
    end

    it 'should take in a message and print it to the console' do
      @console.output('A console instance printed this test message')
      output = $stdout.string.split("\n")

      expect(output).to include('A console instance printed this test message')
    end

    describe '.welcome' do
      it 'should display the Welcome message' do
        @console.welcome
        output = $stdout.string.split("\n")

        expect(output).to include('Welcome to TIC TAC TOE', 'Select game options:')
      end
    end

    describe '.menu_error' do
      it 'should display the Menu error message' do
        @console.menu_error
        output = $stdout.string.split("\n")

        expect(output).to include('Invalid selection! Please choose from the numbers listed above.')
      end
    end

    describe '.marker_error' do
      it "should display the 'Wrong Length' error message when error type is 'length'" do
        @console.marker_error('length')
        output = $stdout.string.split("\n")

        expect(output).to include('Markers must be one single character. Please try again:')
      end

      it "should display the 'Number' error message when error type is 'number'" do
        @console.marker_error('number')
        output = $stdout.string.split("\n")

        expect(output).to include('A marker cannot be a number. Please try again:')
      end

      it "should display the 'Duplicate' error message when error type is 'duplicate'" do
        @console.marker_error('duplicate')
        output = $stdout.string.split("\n")

        expect(output).to include('This marker has already been selected. Please try again:')
      end
    end

    describe '.language_menu' do
      it 'should display the Language menu' do
        @console.language_menu
        output = $stdout.string.split("\n")
        expect(output).to include('Please select your language:')
      end
    end

    describe '.player_menu' do
      before do
        @console.player_menu
        @output = $stdout.string.split("\n")
      end

      it 'should display the Player menu' do
        expect(@output).to include('Who would you like to play against?')
      end

      it 'should translate the player options for the selected locale' do
        expect(@output).to include('1 - Another player', '2 - Computer')
      end
    end

    describe '.order_menu' do
      @console = MainConsole.new
      $stdout = StringIO.new
      unordered_players = [HumanPlayer.new('player.human1'), HumanPlayer.new('player.human2')]
      @console.order_menu(unordered_players)
      output = $stdout.string.split("\n")

      it 'should display the player Order menu' do
        expect(output).to include('Who should take the first turn?')
      end

      it "should correctly display the first player's name" do
        expect(output).to include('1 - Player 1')
      end

      it "should correctly display the second player's name" do
        expect(output).to include('2 - Player 2')
      end
    end

    describe '.board_menu' do
      it 'should display the Board menu' do
        @console.board_menu
        output = $stdout.string.split("\n")
        expect(output).to include('What size board would you like?')
      end
    end

    describe '.marker_prompt' do
      it 'should prompt the user to select a marker for a given player' do
        player = HumanPlayer.new('player.human1')
        @console.marker_prompt(player)
        output = $stdout.string.split("\n")

        expect(output).to include('Select a marker for Player 1:')
      end
    end

    describe '.new_game' do
      it 'should display the New Game message' do
        @console.new_game
        output = $stdout.string.split("\n")
        expect(output).to include('Starting new game...')
      end
    end

    describe '.goodbye' do
      it 'should display the Goodbye message' do
        @console.goodbye
        output = $stdout.string.split("\n")
        expect(output).to include('Thanks for playing! Goodbye.')
      end
    end
  end

  context 'when locale is :es (Spanish)' do
    before do
      @console.switch_language(:es)
    end

    it 'should take in a message and print it to the console' do
      @console.output('A console instance printed this test message')
      output = $stdout.string.split("\n")

      expect(output).to include('A console instance printed this test message')
    end

    describe '.welcome' do
      it 'should translate the Welcome message' do
        @console.welcome
        output = $stdout.string.split("\n")

        expect(output).to include('Bienvenido a TIC TAC TOE', 'Seleccionar opciones de juego:')
      end
    end

    describe '.menu_error' do
      it 'should translate the Menu error message' do
        @console.menu_error
        output = $stdout.string.split("\n")

        expect(output).to include('??Selecci??n invalida! Elija entre los n??meros enumerados anteriormente.')
      end
    end

    describe '.marker_error' do
      it "should translate the 'Wrong Length' error message when error type is 'length'" do
        @console.marker_error('length')
        output = $stdout.string.split("\n")

        expect(output).to include('Los marcadores deben ser un solo car??cter. Int??ntalo de nuevo:')
      end

      it "should translate the 'Number' error message when error type is 'number'" do
        @console.marker_error('number')
        output = $stdout.string.split("\n")

        expect(output).to include('Un marcador no puede ser un n??mero. Int??ntalo de nuevo:')
      end

      it "should translate the 'Duplicate' error message when error type is 'duplicate'" do
        @console.marker_error('duplicate')
        output = $stdout.string.split("\n")

        expect(output).to include('Este marcador ya ha sido seleccionado. Int??ntalo de nuevo:')
      end
    end

    describe '.language_menu' do
      it 'should translate the Language menu' do
        @console.language_menu
        output = $stdout.string.split("\n")
        expect(output).to include('Seleccione su idioma:')
      end
    end

    describe '.player_menu' do
      before do
        @console.player_menu
        @output = $stdout.string.split("\n")
      end

      it 'should display the Player menu' do
        expect(@output).to include('??Contra qui??n te gustar??a jugar?')
      end

      it 'should translate the player options for the selected locale' do
        expect(@output).to include('1 - Otro jugador', '2 - Computadora')
      end
    end

    describe '.order_menu' do
      @console = MainConsole.new
      $stdout = StringIO.new
      @console.switch_language(:es)
      unordered_players = [HumanPlayer.new('player.human1'), HumanPlayer.new('player.human2')]
      @console.order_menu(unordered_players)
      output = $stdout.string.split("\n")

      it 'should translate the player Order menu' do
        expect(output).to include('??Qui??n debe tomar el primer turno?')
      end

      it "should correctly translate the first player's name" do
        expect(output).to include('1 - Jugador 1')
      end

      it "should correctly translate the second player's name" do
        expect(output).to include('2 - Jugador 2')
      end
    end

    describe '.board_menu' do
      it 'should translate the Board menu' do
        @console.board_menu
        output = $stdout.string.split("\n")
        expect(output).to include('??Qu?? tama??o de tabla te gustar??a?')
      end
    end

    describe '.marker_prompt' do
      it 'should translate the prompt asking the user to select a marker' do
        player = HumanPlayer.new('player.human1')
        @console.marker_prompt(player)
        output = $stdout.string.split("\n")

        expect(output).to include('Selecciona un marcador para Jugador 1:')
      end
    end

    describe '.new_game' do
      it 'should display the New Game message' do
        @console.new_game
        output = $stdout.string.split("\n")
        expect(output).to include('Comenzando nuevo juego...')
      end
    end

    describe '.goodbye' do
      it 'should display the Goodbye message' do
        @console.goodbye
        output = $stdout.string.split("\n")
        expect(output).to include('??Gracias por jugar! Adi??s.')
      end
    end
  end

  context 'when locale is :ko (Korean)' do
    before do
      @console.switch_language(:ko)
    end

    it 'should take in a message and print it to the console' do
      @console.output('A console instance printed this test message')
      output = $stdout.string.split("\n")

      expect(output).to include('A console instance printed this test message')
    end

    describe '.welcome' do
      it 'should translate the Welcome message' do
        @console.welcome
        output = $stdout.string.split("\n")

        expect(output).to include('TIC TAC TOE??? ?????? ?????? ???????????????', '?????? ?????? ??????:')
      end
    end

    describe '.menu_error' do
      it 'should translate the Menu error message' do
        @console.menu_error
        output = $stdout.string.split("\n")

        expect(output).to include('????????? ??????! ?????? ????????? ?????? ????????? ??????????????????.')
      end
    end

    describe '.marker_error' do
      it "should translate the 'Wrong Length' error message when error type is 'length'" do
        @console.marker_error('length')
        output = $stdout.string.split("\n")

        expect(output).to include('????????? ????????? ?????? ???????????? ?????????. ?????? ??????????????????:')
      end

      it "should translate the 'Number' error message when error type is 'number'" do
        @console.marker_error('number')
        output = $stdout.string.split("\n")

        expect(output).to include('????????? ????????? ??? ??? ????????????. ?????? ??????????????????:')
      end

      it "should translate the 'Duplicate' error message when error type is 'duplicate'" do
        @console.marker_error('duplicate')
        output = $stdout.string.split("\n")

        expect(output).to include('??? ????????? ?????? ?????????????????????. ?????? ??????????????????:')
      end
    end

    describe '.language_menu' do
      it 'should translate the Language menu' do
        @console.language_menu
        output = $stdout.string.split("\n")
        expect(output).to include('????????? ???????????????:')
      end
    end

    describe '.player_menu' do
      before do
        @console.player_menu
        @output = $stdout.string.split("\n")
      end

      it 'should display the Player menu' do
        expect(@output).to include('????????? ???????????? ?????????????')
      end

      it 'should translate the player options for the selected locale' do
        expect(@output).to include('1 - ??? ?????? ??????', '2 - ?????????')
      end
    end

    describe '.order_menu' do
      @console = MainConsole.new
      $stdout = StringIO.new
      @console.switch_language(:ko)
      unordered_players = [HumanPlayer.new('player.human1'), HumanPlayer.new('player.human2')]
      @console.order_menu(unordered_players)
      output = $stdout.string.split("\n")

      it 'should translate the player Order menu' do
        expect(output).to include('?????? ?????? ?????? ?????? ??????????')
      end

      it "should correctly translate the first player's name" do
        expect(output).to include('1 - ???????????? 1')
      end

      it "should correctly translate the second player's name" do
        expect(output).to include('2 - ???????????? 2')
      end
    end

    describe '.board_menu' do
      it 'should translate the Board menu' do
        @console.board_menu
        output = $stdout.string.split("\n")
        expect(output).to include('?????? ????????? ????????? ????????????????')
      end
    end

    describe '.marker_prompt' do
      it 'should translate the prompt asking the user to select a marker' do
        player = HumanPlayer.new('player.human1')
        @console.marker_prompt(player)
        output = $stdout.string.split("\n")

        expect(output).to include('???????????? 1??? ?????? ??????:')
      end
    end

    describe '.new_game' do
      it 'should display the New Game message' do
        @console.new_game
        output = $stdout.string.split("\n")
        expect(output).to include('??? ?????? ?????? ???...')
      end
    end

    describe '.goodbye' do
      it 'should display the Goodbye message' do
        @console.goodbye
        output = $stdout.string.split("\n")
        expect(output).to include('???????????? ?????????! ??????.')
      end
    end
  end
end
