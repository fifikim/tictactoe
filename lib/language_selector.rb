# frozen_string_literal: true

class LanguageSelector
  LANGUAGE_OPTIONS = [
    ['English', 'en'],
    ['Spanish', 'es'],
    ['Korean', 'ko']
  ].freeze

  def self.validate(selection)
    range = 0...LANGUAGE_OPTIONS.length
    range.include? selection
  end

  def self.record(selection)
    LANGUAGE_OPTIONS[selection][1]
  end
end
