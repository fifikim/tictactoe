# frozen_string_literal: true

require 'language_selector'
require 'i18n'

describe LanguageSelector do
  describe '.validate' do
    it 'returns true when a valid selection is entered' do
      selection_valid = LanguageSelector.validate(1)

      expect(selection_valid).to be true
    end

    {
      'n' => 'not a number',
      -1 => 'a negative number',
      3 => 'an out of range number',
      ' ' => 'an empty space',
      nil => 'nil'
    }.each do |invalid_input, type|
      it "returns false when input is #{type}" do
        validate = LanguageSelector.validate(invalid_input)
        expect(validate).to be false
      end
    end
  end

  describe '.record' do
    context "when '1' (index 0) is selected" do
      it 'returns the locale symbol for English (:en)' do
        selection = 0
        locale = LanguageSelector.record(selection)

        expect(locale).to eq(:en)
      end
    end

    context "when '2' (index 1) is selected" do
      it 'returns the locale symbol for Spanish (:es)' do
        selection = 1
        locale = LanguageSelector.record(selection)

        expect(locale).to eq(:es)
      end
    end

    context "when '3' (index 2) is selected" do
      it 'returns the locale symbol for Korean (:ko)' do
        selection = 2
        locale = LanguageSelector.record(selection)

        expect(locale).to eq(:ko)
      end
    end
  end
end
