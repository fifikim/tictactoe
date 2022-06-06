# frozen_string_literal: true

require 'translator'

describe Translator do
  before do
    @translator = Translator.new
  end

  describe '.initialize' do
    it 'intializes locale to English by default' do
      locale = @translator.locale
      expect(locale).to eq(:en)
    end
  end

  describe '.locale' do
    it 'returns the current locale' do
      locale = @translator.locale
      expect(locale).to eq(:en)
    end
  end

  describe '.switch_locale' do
    it 'switches locale to the given symbol' do
      @translator.switch_locale(:es)
      locale = @translator.locale

      expect(locale).to eq(:es)
    end
  end

  describe '.translate' do
    context 'when locale is set to :en' do
      it 'takes in a message key and returns the translated message' do
        @translator.switch_locale(:en)
        message = @translator.translate('test')

        expect(message).to eq('this is a test')
      end
    end

    context 'when locale is set to :es' do
      it 'takes in a message key and returns the translated message' do
        @translator.switch_locale(:es)
        message = @translator.translate('test')

        expect(message).to eq("esto es una prueba")
      end
    end

    context 'when locale is set to :ko' do
      it 'takes in a message key and returns the translated message' do
        @translator.switch_locale(:ko)
        message = @translator.translate('test')

        expect(message).to eq("이것은 시험이다")
      end
    end
  end
end
