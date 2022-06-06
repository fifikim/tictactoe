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
      it 'should display the welcome message' do
        @console.welcome
        output = $stdout.string.split("\n")

        expect(output).to include("Welcome to TIC TAC TOE", "Select game options:")
      end
    end

    describe '.menu_error' do
      it 'should display the menu error message' do
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
      it 'should display the language menu' do
        @console.language_menu
        output = $stdout.string.split("\n")
        expect(output).to include('Please select your language:')
      end
    end

    describe '.player_menu' do
      it 'should display the player menu' do
        @console.player_menu
        output = $stdout.string.split("\n")
        expect(output).to include('Who would you like to play against?')
      end

      it 'should translate the player options for the selected locale' do
      end
    end

    describe '.order_menu' do
      @console = MainConsole.new
      $stdout = StringIO.new
      unordered_players = [HumanPlayer.new('player.human1'), HumanPlayer.new('player.human2')]
      @console.order_menu(unordered_players)
      output = $stdout.string.split("\n")

      it 'should display the player order menu' do
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
      it 'should display the board menu' do
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
      it 'should display the new game message' do
        @console.new_game
        output = $stdout.string.split("\n")
        expect(output).to include('Starting new game...')
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
      it 'should translate the welcome message' do
        @console.welcome
        output = $stdout.string.split("\n")

        expect(output).to include("Bienvenido a TIC TAC TOE", "Seleccionar opciones de juego:")
      end
    end

    describe '.menu_error' do
      it 'should translate the menu error message' do
        @console.menu_error
        output = $stdout.string.split("\n")

        expect(output).to include('¡Selección invalida! Elija entre los números enumerados anteriormente.')
      end
    end

    describe '.marker_error' do
      it "should translate the 'Wrong Length' error message when error type is 'length'" do
        @console.marker_error('length')
        output = $stdout.string.split("\n")

        expect(output).to include('Los marcadores deben ser un solo carácter. Inténtalo de nuevo:')
      end

      it "should translate the 'Number' error message when error type is 'number'" do
        @console.marker_error('number')
        output = $stdout.string.split("\n")

        expect(output).to include('Un marcador no puede ser un número. Inténtalo de nuevo:')
      end

      it "should translate the 'Duplicate' error message when error type is 'duplicate'" do
        @console.marker_error('duplicate')
        output = $stdout.string.split("\n")

        expect(output).to include('Este marcador ya ha sido seleccionado. Inténtalo de nuevo:')
      end
    end

    describe '.language_menu' do
      it 'should translate the language menu' do
        @console.language_menu
        output = $stdout.string.split("\n")
        expect(output).to include('Seleccione su idioma:')
      end
    end

    describe '.player_menu' do
      it 'should translate the player menu' do
        @console.player_menu
        output = $stdout.string.split("\n")
        expect(output).to include('¿Contra quién te gustaría jugar?')
      end

      it 'should translate the player options for the selected locale' do
      end
    end

    describe '.order_menu' do
      @console = MainConsole.new
      $stdout = StringIO.new
      @console.switch_language(:es)
      unordered_players = [HumanPlayer.new('player.human1'), HumanPlayer.new('player.human2')]
      @console.order_menu(unordered_players)
      output = $stdout.string.split("\n")

      it 'should translate the player order menu' do
        expect(output).to include('¿Quién debe tomar el primer turno?')
      end

      it "should correctly translate the first player's name" do
        expect(output).to include('1 - Jugador 1')
      end

      it "should correctly translate the second player's name" do
        expect(output).to include('2 - Jugador 2')
      end
    end

    describe '.board_menu' do
      it 'should translate the board menu' do
        @console.board_menu
        output = $stdout.string.split("\n")
        expect(output).to include('¿Qué tamaño de tabla te gustaría?')
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
      it 'should display the new game message' do
        @console.new_game
        output = $stdout.string.split("\n")
        expect(output).to include('Comenzando nuevo juego...')
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
      it 'should translate the welcome message' do
        @console.welcome
        output = $stdout.string.split("\n")

        expect(output).to include("TIC TAC TOE에 오신 것을 환영합니다", "게임 옵션 선택:")
      end
    end

    describe '.menu_error' do
      it 'should translate the menu error message' do
        @console.menu_error
        output = $stdout.string.split("\n")

        expect(output).to include('잘못된 선택! 위에 나열된 번호 중에서 선택하십시오.')
      end
    end

    describe '.marker_error' do
      it "should translate the 'Wrong Length' error message when error type is 'length'" do
        @console.marker_error('length')
        output = $stdout.string.split("\n")

        expect(output).to include('마커는 하나의 단일 문자여야 합니다. 다시 시도하십시오:')
      end

      it "should translate the 'Number' error message when error type is 'number'" do
        @console.marker_error('number')
        output = $stdout.string.split("\n")

        expect(output).to include('마커는 숫자가 될 수 없습니다. 다시 시도하십시오:')
      end

      it "should translate the 'Duplicate' error message when error type is 'duplicate'" do
        @console.marker_error('duplicate')
        output = $stdout.string.split("\n")

        expect(output).to include('이 마커는 이미 선택되었습니다. 다시 시도하십시오:')
      end
    end

    describe '.language_menu' do
      it 'should translate the language menu' do
        @console.language_menu
        output = $stdout.string.split("\n")
        expect(output).to include('언어를 선택하세요:')
      end
    end

    describe '.player_menu' do
      it 'should translate the player menu' do
        @console.player_menu
        output = $stdout.string.split("\n")
        expect(output).to include('누구와 경기하고 싶습니까?')
      end

      it 'should translate the player options for the selected locale' do
      end
    end

    describe '.order_menu' do
      @console = MainConsole.new
      $stdout = StringIO.new
      @console.switch_language(:ko)
      unordered_players = [HumanPlayer.new('player.human1'), HumanPlayer.new('player.human2')]
      @console.order_menu(unordered_players)
      output = $stdout.string.split("\n")

      it 'should translate the player order menu' do
        expect(output).to include('누가 먼저 턴을 해야 할까요?')
      end

      it "should correctly translate the first player's name" do
        expect(output).to include('1 - 플레이어 1')
      end

      it "should correctly translate the second player's name" do
        expect(output).to include('2 - 플레이어 2')
      end
    end

    describe '.board_menu' do
      it 'should translate the board menu' do
        @console.board_menu
        output = $stdout.string.split("\n")
        expect(output).to include('어떤 크기의 보드를 원하십니까?')
      end
    end

    describe '.marker_prompt' do
      it 'should translate the prompt asking the user to select a marker' do
        player = HumanPlayer.new('player.human1')
        @console.marker_prompt(player)
        output = $stdout.string.split("\n")

        expect(output).to include('플레이어 1의 마커 선택:')
      end
    end

    describe '.new_game' do
      it 'should display the new game message' do
        @console.new_game
        output = $stdout.string.split("\n")
        expect(output).to include('새 게임 시작 중...')
      end
    end
  end
end
