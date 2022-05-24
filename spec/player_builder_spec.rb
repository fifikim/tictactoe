# frozen_string_literal: true

require 'player_builder'
require 'easy_ai'
require 'player'

describe PlayerBuilder do
  describe '.create_first_player' do
    let(:main_double) { Class.new { extend PlayerBuilder } }

    {
      'Computer' => EasyAiPlayer,
      'not Computer' => Player
    }.each do |type, class_name|
      context "when first player is #{type}" do
        before do
          @player = main_double.create_first_player(type)
        end

        it "creates an instance of #{class_name}" do
          expect(@player).to be_an_instance_of(class_name)
        end

        it "assigns player a marker of 'X'" do
          expect(@player.marker).to eq('X')
        end
      end
    end
  end

  describe '.create_second_player' do
    let(:main_double) { Class.new { extend PlayerBuilder } }

    {
      'Computer' => EasyAiPlayer,
      'not Computer' => Player
    }.each do |type, class_name|
      context "when second player is #{type}" do
        before do
          @player = main_double.create_second_player(type)
        end

        it "creates an instance of #{class_name}" do
          expect(@player).to be_an_instance_of(class_name)
        end

        it "assigns player a marker of 'O'" do
          expect(@player.marker).to eq('O')
        end
      end
    end
  end
end
