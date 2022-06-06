# frozen_string_literal: true

require_relative 'translator'

class LanguageSelector
  LANGUAGE_OPTIONS = [
    ['language.en', :en],
    ['language.es', :es],
    ['language.ko', :ko]
  ].freeze

  def self.validate(selection)
    range = 0...LANGUAGE_OPTIONS.length
    range.include? selection
  end

  def self.record(selection)
    LANGUAGE_OPTIONS[selection][1]
  end
end
