# frozen_string_literal: true

require 'board'
require 'game_console'
require 'stringio'
require 'human_player'

describe GameConsole do
  before do
    @console = GameConsole.new
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

    it 'should display the current turn message with the correct player' do
      turn_message = 'turn.human'
      player = 'player.human1'
      @console.turn(turn_message, player)
      output = $stdout.string.split("\n")

      expect(output).to include("Player 1's move:")
    end

    it 'should take in a message and print it to the console' do
      @console.occupied
      output = $stdout.string.split("\n")

      expect(output).to include('Invalid move! Please select a free space:')
    end

    it 'should display the Game Won message with the correct winner' do
      player = 'player.human1'
      @console.win(player)
      output = $stdout.string.split("\n")

      expect(output).to include('Game over! Player 1 wins!')
    end

    it 'should display the Game Drawn message' do
      @console.draw
      output = $stdout.string.split("\n")

      expect(output).to include("Game over! It's a draw!")
    end

    context 'when the board is 3x3' do
      before do
        @console = GameConsole.new(9)
        @board = Board.new
      end

      describe '.instructions' do
        it 'should display the instructions with correct input range of 1-9' do
          @console.instructions(HumanPlayer.new('player.human1', 'X'),
                                HumanPlayer.new('player.human2', 'O'))
          @output = $stdout.string.split("\n")
          expect(@output).to include('Enter the number (1-9) of the space on the board where you want to move.')
        end
      end

      describe '.board' do
        it 'should print the current state of the board in a 3x3 template' do
          @console.board(@board)
          @output = $stdout.string.split("\n")
          expect(@output).to include('  1 |  2 |  3 ')
        end
      end

      describe '.invalid' do
        it 'should print the invalid character message with the correct range' do
          @console.invalid
          @output = $stdout.string.split("\n")
          expect(@output).to include('Invalid character! Please select an integer from 1-9:')
        end
      end
    end

    context 'when the board is 4x4' do
      before do
        @console = GameConsole.new(16)
        @board = Board.new((1..16).to_a)
      end

      describe '.instructions' do
        it 'should display the instructions with correct input range of 1-16' do
          @console.instructions(HumanPlayer.new('player.human1', 'X'),
                                HumanPlayer.new('player.human2', 'O'))
          @output = $stdout.string.split("\n")
          expect(@output).to include('Enter the number (1-16) of the space on the board where you want to move.')
        end
      end

      describe '.board' do
        it 'should print the current state of the board with the correct template' do
          @console.board(@board)
          @output = $stdout.string.split("\n")

          expect(@output).to include('  1 |  2 |  3 |  4 ')
        end
      end

      describe '.invalid' do
        it 'should print the invalid character message with the correct range' do
          @console.invalid
          @output = $stdout.string.split("\n")
          expect(@output).to include('Invalid character! Please select an integer from 1-16:')
        end
      end
    end

    context 'when the board is 5x5' do
      before do
        @console = GameConsole.new(25)
        @board = Board.new((1..25).to_a)
      end

      describe '.instructions' do
        it 'should display the instructions with correct input range of 1-25' do
          @console.instructions(HumanPlayer.new('player.human1', 'X'),
                                HumanPlayer.new('player.human2', 'O'))
          @output = $stdout.string.split("\n")

          expect(@output).to include('Enter the number (1-25) of the space on the board where you want to move.')
        end
      end

      describe '.board' do
        it 'should print the current state of the board with the correct template' do
          @console.board(@board)
          @output = $stdout.string.split("\n")

          expect(@output).to include('  1 |  2 |  3 |  4 |  5 ')
        end
      end

      describe '.invalid' do
        it 'should print the invalid character message with the correct range' do
          @console.invalid
          @output = $stdout.string.split("\n")
          expect(@output).to include('Invalid character! Please select an integer from 1-25:')
        end
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

    it 'should translate the Current Turn message with the correct player' do
      turn_message = 'turn.human'
      player = 'player.human1'
      @console.turn(turn_message, player)
      output = $stdout.string.split("\n")

      expect(output).to include('Movimiento de Jugador 1:')
    end

    it 'should translate the Occupied Space error message' do
      @console.occupied
      output = $stdout.string.split("\n")

      expect(output).to include('¡Movimiento inválido! Seleccione un espacio libre:')
    end

    it 'should translate the Game Won message with the correct winner' do
      winner = 'player.human1'
      @console.win(winner)
      output = $stdout.string.split("\n")

      expect(output).to include('¡Juego terminado! ¡Jugador 1 gana!')
    end

    it 'should translate the Game Drawn message' do
      @console.draw
      output = $stdout.string.split("\n")

      expect(output).to include('¡Juego terminado! ¡Es un empate!')
    end

    context 'when the board is 3x3' do
      before do
        @console = GameConsole.new(9)
        @console.switch_language(:es)
        @board = Board.new
      end

      describe '.instructions' do
        it 'should translate the instructions with the correct parameters' do
          @console.instructions(HumanPlayer.new('player.human1', 'X'),
                                HumanPlayer.new('player.human2', 'O'))
          @output = $stdout.string.split("\n")
          expect(@output).to include('Ingresa el número (1-9) del espacio en el tablero donde deseas mover.')
        end
      end

      describe '.board' do
        it 'should print the current state of the board in a 3x3 template' do
          @console.board(@board)
          @output = $stdout.string.split("\n")
          expect(@output).to include('  1 |  2 |  3 ')
        end
      end

      describe '.invalid' do
        it 'should translate the invalid character message with the correct range' do
          @console.invalid
          @output = $stdout.string.split("\n")
          expect(@output).to include('¡Carácter no válido! Seleccione un número entero entre 1 y 9:')
        end
      end
    end

    context 'when the board is 4x4' do
      before do
        @console = GameConsole.new(16)
        @console.switch_language(:es)
        @board = Board.new((1..16).to_a)
      end

      describe '.instructions' do
        it 'should translate the instructions with correct input range of 1-16' do
          @console.instructions(HumanPlayer.new('player.human1', 'X'),
                                HumanPlayer.new('player.human2', 'O'))
          @output = $stdout.string.split("\n")
          expect(@output).to include('Ingresa el número (1-16) del espacio en el tablero donde deseas mover.')
        end
      end

      describe '.board' do
        it 'should print the current state of the board with the correct template' do
          @console.board(@board)
          @output = $stdout.string.split("\n")

          expect(@output).to include('  1 |  2 |  3 |  4 ')
        end
      end

      describe '.invalid' do
        it 'should translate the invalid character message with the correct range' do
          @console.invalid
          @output = $stdout.string.split("\n")
          expect(@output).to include('¡Carácter no válido! Seleccione un número entero entre 1 y 16:')
        end
      end
    end

    context 'when the board is 5x5' do
      before do
        @console = GameConsole.new(25)
        @console.switch_language(:es)
        @board = Board.new((1..25).to_a)
      end

      describe '.instructions' do
        it 'should translate the instructions with correct input range of 1-25' do
          @console.instructions(HumanPlayer.new('player.human1', 'X'),
                                HumanPlayer.new('player.human2', 'O'))
          @output = $stdout.string.split("\n")

          expect(@output).to include('Ingresa el número (1-25) del espacio en el tablero donde deseas mover.')
        end
      end

      describe '.board' do
        it 'should print the current state of the board with the correct template' do
          @console.board(@board)
          @output = $stdout.string.split("\n")

          expect(@output).to include('  1 |  2 |  3 |  4 |  5 ')
        end
      end

      describe '.invalid' do
        it 'should translate the invalid character message with the correct range' do
          @console.invalid
          @output = $stdout.string.split("\n")
          expect(@output).to include('¡Carácter no válido! Seleccione un número entero entre 1 y 25:')
        end
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

    it 'should translate the Current Turn message with the correct player' do
      turn_message = 'turn.human'
      player = 'player.human1'
      @console.turn(turn_message, player)
      output = $stdout.string.split("\n")

      expect(output).to include('플레이어 1의 움직임:')
    end

    it 'should translate the Occupied Space error message' do
      @console.occupied
      output = $stdout.string.split("\n")

      expect(output).to include('잘못된 움직임! 여유 공간을 선택하십시오:')
    end

    it 'should translate the Game Won message with the correct winner' do
      winner = 'player.human1'
      @console.win(winner)
      output = $stdout.string.split("\n")

      expect(output).to include('게임 끝! 플레이어 1가 이겼습니다!')
    end

    it 'should translate the Game Drawn message' do
      @console.draw
      output = $stdout.string.split("\n")

      expect(output).to include('게임 끝! 무승부입니다!')
    end

    context 'when the board is 3x3' do
      before do
        @console = GameConsole.new(9)
        @console.switch_language(:ko)
        @board = Board.new
      end

      describe '.instructions' do
        it 'should translate the instructions with the correct range' do
          @console.instructions(HumanPlayer.new('player.human1', 'X'),
                                HumanPlayer.new('player.human2', 'O'))
          @output = $stdout.string.split("\n")
          expect(@output).to include('이동하려는 보드의 공간 번호(1-9)를 입력하세요.')
        end
      end

      describe '.board' do
        it 'should print the current state of the board in a 3x3 template' do
          @console.board(@board)
          @output = $stdout.string.split("\n")
          expect(@output).to include('  1 |  2 |  3 ')
        end
      end

      describe '.invalid' do
        it 'should translate the Invalid Character message with the correct range' do
          @console.invalid
          @output = $stdout.string.split("\n")
          expect(@output).to include('잘못된 문자입니다. 1-9에서 정수를 선택하세요.')
        end
      end
    end

    context 'when the board is 4x4' do
      before do
        @console = GameConsole.new(16)
        @console.switch_language(:ko)
        @board = Board.new((1..16).to_a)
      end

      describe '.instructions' do
        it 'should translate the instructions with correct input range of 1-16' do
          @console.instructions(HumanPlayer.new('player.human1', 'X'),
                                HumanPlayer.new('player.human2', 'O'))
          @output = $stdout.string.split("\n")
          expect(@output).to include('이동하려는 보드의 공간 번호(1-16)를 입력하세요.')
        end
      end

      describe '.board' do
        it 'should print the current state of the board with the correct template' do
          @console.board(@board)
          @output = $stdout.string.split("\n")

          expect(@output).to include('  1 |  2 |  3 |  4 ')
        end
      end

      describe '.invalid' do
        it 'should translate the invalid character message with the correct range' do
          @console.invalid
          @output = $stdout.string.split("\n")
          expect(@output).to include('잘못된 문자입니다. 1-16에서 정수를 선택하세요.')
        end
      end
    end

    context 'when the board is 5x5' do
      before do
        @console = GameConsole.new(25)
        @console.switch_language(:ko)
        @board = Board.new((1..25).to_a)
      end

      describe '.instructions' do
        it 'should translate the instructions with correct input range of 1-25' do
          @console.instructions(HumanPlayer.new('player.human1', 'X'),
                                HumanPlayer.new('player.human2', 'O'))
          @output = $stdout.string.split("\n")

          expect(@output).to include('이동하려는 보드의 공간 번호(1-25)를 입력하세요.')
        end
      end

      describe '.board' do
        it 'should print the current state of the board with the correct template' do
          @console.board(@board)
          @output = $stdout.string.split("\n")

          expect(@output).to include('  1 |  2 |  3 |  4 |  5 ')
        end
      end

      describe '.invalid' do
        it 'should translate the invalid character message with the correct range' do
          @console.invalid
          @output = $stdout.string.split("\n")
          expect(@output).to include('잘못된 문자입니다. 1-25에서 정수를 선택하세요.')
        end
      end
    end
  end
end
