# frozen_string_literal: true

require 'i18n'

class Translator
  def initialize
    @translator = I18n

    @translator.load_path << Dir["#{File.expand_path('locales')}/*.yml"]
  end

  def locale
    @translator.locale
  end

  def switch_locale(locale)
    @translator.locale = locale
  end

  def translate(message_key, **params)
    @translator.t(message_key, **params)
  end
end
