# frozen_string_literal: true

require 'i18n'

$LOCALE_OPTIONS = [
  ['English', :en],
  ['Espanol', :es],
  ['Korean', :ko]
]

class LocaleSelector
  def self.validate(selection)
    range = 0...$LOCALE_OPTIONS.length
    range.include? selection
  end

  def self.record(selection)
    I18n.locale = $LOCALE_OPTIONS[selection][1]
  end
end

